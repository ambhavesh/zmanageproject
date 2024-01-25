sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'manageproject/test/integration/FirstJourney',
		'manageproject/test/integration/pages/ProjectSetList',
		'manageproject/test/integration/pages/ProjectSetObjectPage',
		'manageproject/test/integration/pages/EmployeeSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectSetList, ProjectSetObjectPage, EmployeeSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('manageproject') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectSetList: ProjectSetList,
					onTheProjectSetObjectPage: ProjectSetObjectPage,
					onTheEmployeeSetObjectPage: EmployeeSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);