// Odata service ready
namespace zmanageproject.srv.service;

using {zmanageproject.db.schema} from '../db/schema';


service MANAGEPROJECTSRV @(
    path    : '/srv-api',
    requires: 'authenticated-user'
) {
    @odata.draft.enabled: true
    entity ProjectSet    as projection on schema.m.Project;

    entity CompanySet    as projection on schema.m.Company;

    entity EmployeeSet @(restrict: [{
        grant: [
            'READ',
            'WRITE'
        ],
        to   : 'Admin'
    }, ])                as projection on schema.t.Employee;

    entity ModuleSet     as projection on schema.t.Module;
    entity AttachmentSet as projection on schema.t.MediaFile;
    function fetchEmployee(companyId : Integer) returns {};
}
