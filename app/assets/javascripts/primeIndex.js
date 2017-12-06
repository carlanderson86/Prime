PrimeIndex = function(){

}

PrimeIndex.load = function(){
    var prime = new Prime();
    $("#calculateBtn").off("click").on("click",function(){

        var gridSize = $("#gridSize").val();

        if(gridSize != null && gridSize != ""){
            gridSize = parseInt(gridSize);
            if(gridSize <= 1){
                $("#gridResponse").html("Please enter a grid size greater than 1");
            }else{
                prime.calculate(gridSize,"#gridResponse");
            }

        }else{
            $("#gridResponse").html("Please enter a grid size");
        }

    });
}