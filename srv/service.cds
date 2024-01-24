namespace zmanageproject.srv.service;

using {zmanageproject.db.schema} from '../db/schema';


service MANAGEPROJECTSRV @(path: '/srv-api') {
    @odata.draft.enabled: true
    entity ProjectSet  as projection on schema.m.Project;

    entity CompanySet  as projection on schema.m.Company;
    entity EmployeeSet as projection on schema.t.Employee;
    entity ModuleSet   as projection on schema.t.Module;
}
