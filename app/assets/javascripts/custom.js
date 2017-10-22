$(document).ready(function(){
  $('#product_type_id').change(function() {
    $.ajax({
      type:"GET",
      url : "/products/sub_product_types",
      data : "product_type_id="+$(this).val(),
      async: false,
      dataType: 'json',
      success : function(response) {
        select = $('#product_sub_product_type_id')
        select.empty();
        $.each(response, function(index, value) {
          select.append(
            $('<option></option>').val(value['id']).html(value['type_name'])
          );
        });
      },
      error: function() {
        alert('Error occured');
      }
    });
  });
});
