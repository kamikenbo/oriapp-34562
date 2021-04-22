 document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('image')){
  const ImageList = document.getElementById('image-list');

  const createImageHTML = (blob) => {
    
   const imageElement = document.createElement('div');

   
   const blobImage = document.createElement('img');
   blobImage.className="preview";
   blobImage.setAttribute('src', blob);

   
   imageElement.appendChild(blobImage);
   ImageList.appendChild(imageElement);
 };

  document.getElementById('image').addEventListener('change', function(e){
 
 const imageContent = document.querySelector('img');
 if (imageContent){
   imageContent.remove();
 }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
     
     
     createImageHTML(blob);
  });
 }
});



document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('video')){
  const VideoList = document.getElementById('video-list');

  const createVideoHTML = (blob) => {

   const VideoElement = document.createElement('div');

   
   const blobVideo = document.createElement('video');
   blobVideo.className="preview";
   blobVideo.setAttribute('src', blob);

   VideoElement.appendChild(blobVideo);
   VideoList.appendChild(VideoElement);
 };

  document.getElementById('video').addEventListener('change', function(e){
 
 const videoContent = document.querySelector('vid');
 if (videoContent){
   videoContent.remove();
 }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
     
     createVideoHTML(blob);
  });
 }
});


