$(function calculateYield() {
  var yearlyYield = $("#landlord_yearly_yield");
  var netYield = $("#landlord_net_yield");
  var maintenaceExpenses = $('#landlord_maintenance_expenses')

  netYield.val(yearlyYield.val()); // Set default net yield field

  $('#landlord_current_rent').on("change", function() {
    yearlyYield.val(this.value * 12); 
    netYield.val(yearlyYield.val() - maintenaceExpenses.val())
  });  

  maintenaceExpenses.on("change", function() {
    netYield.val(yearlyYield.val() - this.value);
  });

});
