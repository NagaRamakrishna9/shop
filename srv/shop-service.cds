using com.shop as db from '../db/sata-model';

service ShopService {
    
    entity Customers  as projection on db.Customers;
    entity Products   as projection on db.Products;
    entity Orders     as projection on db.Orders;
    entity OrderItems as projection on db.OrderItems;

}
