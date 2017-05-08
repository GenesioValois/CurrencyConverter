$(document).ready ->

  $('form').change ->
    ajaxExchange()

  ajaxExchange = () ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;

  $('#switch-currency').click ->
    from_currency = $('#currency').val()
    to_currency = $('#currency_destination').val()
    $('#currency').val(to_currency)
    $('#currency_destination').val(from_currency)
    ajaxExchange()
    event.preventDefault()
