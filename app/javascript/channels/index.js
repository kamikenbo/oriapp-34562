// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

// const channels = require.context('.', true, /_channel\.js$/)
// channels.keys().forEach(channels)

window.addEventListener('load', function(){

const pullDownButton = document.getElementById("check")
const pullDownParents = document.getElementById("pull-down")

pullDownButton.addEventListener('mouseover', function(){
  this.setAttribute("style", "background-color:#f5f5f5;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color:#f5f5f5;")
  })

  pullDownButton.addEventListener('click', function() {
    pullDownParents.setAttribute("style", "display:block;")
  })
})


window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("click-js")
  const pullDownParents = document.getElementById("pull-down-iine")
  
  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:#f5f5f5;")
    })
  
    pullDownButton.addEventListener('mouseout', function(){
      this.removeAttribute("style", "background-color:#f5f5f5;")
    })
  
    pullDownButton.addEventListener('click', function() {
      pullDownParents.setAttribute("style", "display:block;")
    })
  })