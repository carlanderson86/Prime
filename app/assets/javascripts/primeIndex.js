PrimeIndex = function(){
}

PrimeIndex.prime = null;

PrimeIndex.load = function(){
    PrimeIndex.prime = new Prime();
    $("#calculateBtn").off("click").on("click",function(){

        var gridSize = $("#gridSize").val();

        if(gridSize != null && gridSize != ""){
            gridSize = parseInt(gridSize);
            if(gridSize <= 1){
                $("#gridResponse").html("Please enter a grid size greater than 1");
            }else{
                PrimeIndex.prime.calculate(gridSize,"#gridResponse","#calculateBtn");
            }

        }else{
            $("#gridResponse").html("Please enter a grid size");
        }

    });
}