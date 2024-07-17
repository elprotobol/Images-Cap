using {db} from '../db/schema';


service MyService {

    entity Padre as projection on db.Padre;
    entity Padre2 as projection on db.Padre2;
    entity Hijo as projection on db.Hijo;
}