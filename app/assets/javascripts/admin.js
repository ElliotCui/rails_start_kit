//= require jquery
//= require jquery_ujs
//= require bootstrap_sb_admin_base_v2
//= require moment
//= require bootstrap-datetimepicker

// =================beautifyImage=================

$(function() { $('.popover-show').popover({trigger: "hover"});});
$(function() {
  $(".image-view").popover({html: true});
});

// =================datetimePicker=================

$(document).ready(function(){
  var year = (new Date()).getFullYear();

  $('#datetimepicker-start').datetimepicker({
    format: 'YYYY-MM-DD hh:mm:ss',
    minDate: new Date(year - 10, 0, 1),
    maxDate: new Date(year + 10, 11, 31)
  });

  $('#datetimepicker-expire').datetimepicker({
    format: 'YYYY-MM-DD hh:mm:ss',
    minDate: new Date(year - 10, 0, 1),
    maxDate: new Date(year + 10, 11, 31)
  });
});

// =================prettyPrint=================

window.prettyPrint = {};
prettyPrint.output = function(id, inp) {
    document.getElementById(id).innerHTML = inp;
}
prettyPrint.syntaxHighlight = function(json) {
    json = JSON.stringify(json, undefined, 2);
    json = json.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
    return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
        var cls = 'number';
        if (/^"/.test(match)) {
            if (/:$/.test(match)) {
                cls = 'key';
            } else {
                cls = 'string';
            }
        } else if (/true|false/.test(match)) {
            cls = 'boolean';
        } else if (/null/.test(match)) {
            cls = 'null';
        }
        return '<span class="' + cls + '">' + match + '</span>';
    });
}