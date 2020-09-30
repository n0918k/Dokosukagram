window.addEventListener('load',function (){
  const click = document.getElementById("item-image")
click.addEventListener("change",(e) => {
  imgPreView(e)

})
});

function imgPreView(e) {
  var file = event.target.files[0];
  var reader = new FileReader();
  var preview = document.getElementById("preview");
  var previewImage = document.getElementById("previewImage");

  if(previewImage != null) {
    preview.removeChild(previewImage);
  }
  reader.onload = function(event) {
    var img = document.createElement("img");
    img.setAttribute("src", reader.result);
    img.setAttribute("id", "previewImage");
    img.setAttribute("width", "30%");
    img.setAttribute("height", "30%");
    preview.appendChild(img);
  };

  reader.readAsDataURL(file);
}