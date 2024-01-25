using zmanageproject.srv.service.MANAGEPROJECTSRV as service from '../../srv/service';

annotate service.ProjectSet with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'projectId',
            Value : projectId,
        },
        {
            $Type : 'UI.DataField',
            Label : 'projectName',
            Value : projectName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'projectStatus',
            Value : projectStatus,
        },
        {
            $Type : 'UI.DataField',
            Label : 'projectBudget',
            Value : projectBudget,
        },
        {
            $Type : 'UI.DataField',
            Label : 'projectDuration',
            Value : projectDuration,
        },
    ]
);
annotate service.ProjectSet with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'projectId',
                Value : projectId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'projectName',
                Value : projectName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'projectStatus',
                Value : projectStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'projectBudget',
                Value : projectBudget,
            },
            {
                $Type : 'UI.DataField',
                Label : 'projectDuration',
                Value : projectDuration,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
