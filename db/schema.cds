namespace zmanageproject.db.schema;

using {
    managed,
    Currency
} from '@sap/cds/common';


context m {
    entity Project : managed {
        key projectId       : Integer;
            projectName     : String;
            projectStatus   : String;
            projectBudget   : Integer;
            projectDuration : String;
            allotedEmployee : Composition of many t.Employee
                                  on allotedEmployee.hasProject = $self;

    }

    entity Company {
        key companyId     : Integer;
            companyName   : String;
            companyRating : Integer;
            hasEmployee   : Association to many t.Employee
                                on hasEmployee.empCompany = $self;
    }
}

context t {
    entity Employee {
        key empId         : Integer;
            empName       : String;
            empGender     : String;
            empExperience : String;
            empSalary     : Integer;
            currency      : Currency;
            empCompany    : Association to m.Company;
            empModule     : Association to t.Module;
            hasProject    : Association to m.Project;
    }

    entity Module {
        key moduleId    : Integer;
            moduleName  : String;
            moduleType  : String;
            hasEmployee : Association to t.Employee
                              on hasEmployee.empModule = $self;
    }
}