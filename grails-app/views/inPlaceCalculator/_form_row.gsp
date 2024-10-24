<%--
 Emitting a single row of a form with label an input field.
 Params:
   name  : name to use for id, name, labelFor
   label : what the user sees beneath the input field
   model : the values to show and error information
 Depends on the "validate" function from outside.
--%>

<%@ page import="static rooms.FieldUtil.*" %>
<script>
  function handleMinError (name) {
      const element = document.getElementById(name);
      if (element.value && Number(element.value) < 1) {
          alert(name + " value needs to be at least 1.0 but was " + element.value);
      }
  }

</script>
<div>
  <label for='${name}'>${label}</label>
  <input type="number" step="0.1" name="${name}" value="${model.getProperty(name)}"
         required="required"  max="6.0" id="${name}"
         class="${hasError(model, name) ? 'error' : ''}"
         title="${g.message(error: findError(model, name)) }"
         onchange="handleMinError('${name}')"
  />
</div>
