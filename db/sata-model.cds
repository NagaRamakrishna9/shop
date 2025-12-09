namespace com.shop;

using { cuid, managed } from '@sap/cds/common';

entity Customers : cuid, managed {
    fullName : String(120);
    email    : String(100);
    phone    : String(20);

    orders : Composition of many Orders
                on orders.customer = $self;
}

entity Products : cuid, managed {
    productName : String(200);
    price       : Decimal(13,2);
    stockQty    : Integer;
}

entity Orders : cuid, managed {
    orderDate  : Date;
    totalAmount: Decimal(15,2);

    customer   : Association to Customers;

    items : Composition of many OrderItems
                on items.order = $self;
}

entity OrderItems : cuid, managed {
    quantity   : Integer;
    lineAmount : Decimal(15,2);

    order   : Association to Orders;
    product : Association to Products;
}
