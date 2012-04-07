

function openFeedback(id){
  $('#'+id).overlay({load: true});
}

$(function() {
    if ($('textarea.ckae').length > 0)
    {
        var data = $('textarea.ckae');
        $.each(data, function(i)
            {
                CKEDITOR.replace(data[i].id);
            }
        );
    }
});