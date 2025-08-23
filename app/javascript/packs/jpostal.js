function jpostal() {
  $('#zipcode').jpostal({
    postcode : ['#zipcode'],
    address : {
      '#park_address': '%3%4%5'
    }
  });
}
$(document).on("turbolinks:load", jpostal);