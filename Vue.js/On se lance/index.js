var message= {

    props:{ 
        message: String
    },

    template : `   <div>  mon bon petit comment tu va?? je suis la et toi?   {{ message }}</div>
    `
}



var vm = new Vue({

el:"#tuto",
components: { message},
data: {

    message: " un meilleur texte",
}
})