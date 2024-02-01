const cds = require('@sap/cds');
const { Readable, PassThrough } = require("stream");

module.exports = (srv => {

    srv.on("fetchEmployee", async (req) => {
        const db = await cds.connect.to('db');
        let { companyId } = req.data;
        let sEmployeeTable = '472F69FE600046AC8331083B00727CC3.ZMANAGEPROJECT_DB_SCHEMA_T_EMPLOYEE';
        let sCompanyTable = '472F69FE600046AC8331083B00727CC3.ZMANAGEPROJECT_DB_SCHEMA_M_COMPANY';
        let sQuery = `SELECT DISTINCT E.empId,E.empName,E.empGender FROM ${sEmployeeTable} as E 
                    INNER JOIN ${sCompanyTable} as C ON C.companyId=E.empCompany_companyId 
                    WHERE C.companyId=${companyId}`;
        try {
            let tx = db.tx();
            const aEmployee = await tx.run(sQuery);
            const oEmployee = {
                "status": 200,
                "value": aEmployee
            };
            const { res } = req.http;
            res.send(oEmployee);
        } catch (error) {
            console.log(error);
        }

    });

    srv.before("CREATE", "MediaFile", async (req) => {
        var tx = cds.transaction(req);

        //below lines are for generating the next sequence number/index value with which attachment willl be stored
        var mediaFileTable = await tx.run(SELECT.from("app.interactions.MediaFile").orderBy`id asc`);
        let mediaFileTableLength = parseInt(mediaFileTable[mediaFileTable.length - 1].id) + 1;
        req.data.id = mediaFileTableLength;


        //Assign the url by appending the generated id
        req.data.url = `/srv-api/MediaFile(${req.data.id})/content`;
    });

    srv.on("READ", 'MediaFile', async (req, next) => {
        if (!req.data.id) {
            return next();
        }


        //Fetch the url from where the req is triggered       
        const url = req._.req.path;
        //If the request url contains keyword "content"
        // then read the media content
        if (url.includes("content")) {
            const id = req.data.id;
            var tx = cds.transaction(req);
            // Fetch the media obj from database
            var mediaObj = await tx.run(
                SELECT.one.from("app.interactions.MediaFile", ["content", "mediaType"]).where(
                    "id =",
                    id
                )
            );
            /*********Decoding from Base64**********/

            if (mediaObj.length <= 0) {
                req.reject(404, "Media not found for the ID");
                return;
            }
            var decodedMedia = "";
            decodedMedia = new Buffer.from(
                mediaObj.content.toString().split(";base64,").pop(),
                "base64"
            );

            return _formatResult(decodedMedia, mediaObj.mediaType);
            /****************************************/
        } else return next();
    });

    function _formatResult(decodedMedia, mediaType) {
        const readable = new Readable();
        const result = new Array();
        readable.push(decodedMedia);
        readable.push(null);
        return {
            value: readable,
            '*@odata.mediaContentType': mediaType
        }
    }

});