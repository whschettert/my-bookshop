using { my.bookshop as my } from '../db/schema';

service AdminService {
  entity Books as projection on my.Books;
  entity Authors as projection on my.Authors;
  entity Orders as select from my.Orders;
}

// Enable Fiori Draft for Orders
annotate AdminService.Orders with @odata.draft.enabled;
// annotate AdminService.Books with @odata.draft.enabled;

// Temporary workaround -> https://github.wdf.sap.corp/cap/issues/issues/3121
extend service AdminService with {
  entity OrderItems as select from my.OrderItems;
}
// Restrict access to orders to users with role "admin"
//  annotate AdminService.Orders with  @(restrict: [
//    { grant: 'READ', to: 'admin' } 
//   ]);