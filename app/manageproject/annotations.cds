using zmanageproject.srv.service.MANAGEPROJECTSRV as service from '../../srv/service';

annotate service.ProjectSet with @(
    UI.LineItem  : [
        {
            $Type: 'UI.DataField',
            Label: 'projectId',
            Value: projectId,
        },
        {
            $Type: 'UI.DataField',
            Label: 'projectName',
            Value: projectName,
        },
        {
            $Type: 'UI.DataField',
            Label: 'projectStatus',
            Value: projectStatus,
        },
        {
            $Type: 'UI.DataField',
            Label: 'projectBudget',
            Value: projectBudget,
        },
        {
            $Type: 'UI.DataField',
            Label: 'projectDuration',
            Value: projectDuration,
        },
    ],
    UI.HeaderInfo: {
        TypeName      : 'Project',
        TypeNamePlural: 'Projects',
        Title         : {
            $Type: 'UI.DataField',
            Value: projectId
        }
    }
);

annotate service.ProjectSet with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'projectId',
                Value: projectId,
            },
            {
                $Type: 'UI.DataField',
                Label: 'projectName',
                Value: projectName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'projectStatus',
                Value: projectStatus,
            },
            {
                $Type: 'UI.DataField',
                Label: 'projectBudget',
                Value: projectBudget,
            },
            {
                $Type: 'UI.DataField',
                Label: 'projectDuration',
                Value: projectDuration,
            },
        ],
    },
    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Working Employee',
            ID    : 'WorkingEmployee',
            Target: 'allotedEmployee/@UI.LineItem#WorkingEmployee',
        },
    ]
);

annotate service.EmployeeSet with @(
    UI.LineItem #WorkingEmployee: [
        {
            $Type: 'UI.DataField',
            Value: empId,
            Label: 'empId',
        },
        {
            $Type: 'UI.DataField',
            Value: empName,
            Label: 'empName',
        },
    ],
    UI.HeaderInfo               : {
        TypeName      : 'Employee',
        TypeNamePlural: 'Employees',
        Title         : {
            $Type: 'UI.DataField',
            Value: empId
        }
    }
);

annotate service.EmployeeSet with @(
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Employee Details',
        ID    : 'EmployeeDetails',
        Target: '@UI.FieldGroup#EmployeeDetails',
    }, ],
    UI.FieldGroup #EmployeeDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: empId,
                Label: 'empId',
            },
            {
                $Type: 'UI.DataField',
                Value: empName,
                Label: 'empName',
            },
            {
                $Type: 'UI.DataField',
                Value: empGender,
                Label: 'empGender',
            },
            {
                $Type: 'UI.DataField',
                Value: empExperience,
                Label: 'empExperience',
            },
            {
                $Type: 'UI.DataField',
                Value: empSalary,
                Label: 'empSalary',
            },
        ],
    }
);
