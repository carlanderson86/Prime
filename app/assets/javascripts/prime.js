Prime = function() {
    this.requests = {};
}

/**
 * Method: calculate
 *
 * Description: start the prime calculation
 *
 * @param grid_size
 * @param selector
 *
 * @author Carl Anderson
 */
Prime.prototype.calculate = function(grid_size, selector){
    var reference = this.guid();

    var data = {
        grid_size:grid_size,
        selector:selector,
        reference:reference
    };

    this.requests[reference] = data;
    var self = this;
    $.ajax({
        url:'prime/calculate',
        method:'GET',
        data:data,
        error: function(xhr,status,error){
            $(selector).html("Failed to contact server");
        },
        success: function(result,status,xhr){
            $(selector).html("Processing");
            self.updateReceived(result)
        }
    });
}

/**
 * Method: updateReceived
 *
 * Description: Update Received
 *
 * @param data
 *
 * @author Carl Anderson
 */
Prime.prototype.updateReceived = function(json){
    if(json.valid){
        this.displayResult(json.data)
    }else{
        var request = this.requests[json.data.reference];
        if(request != null){
            $(selector).html(json.message);
        }
    }
}


/**
 * Method: updateReceived
 *
 * Description: Update Received
 *
 * @param data
 *
 * @author Carl Anderson
 */
Prime.prototype.displayResult = function(data){

    var request = this.requests[data.reference];

    if(request != null){
        var selector = request.selector;
        var container = $(selector);
        container.empty();
        var result = data.result;

        var row,entry,element,rowElement = null;
        var width = container.width() / result.length;
        for(var y = 0;y < result.length;y++){
            row = result[y];
            rowElement = document.createElement("div");
            for(var x = 0;x < row.length;x++){
                entry = row[x];
                element = document.createElement("span");
                element.setAttribute("style","width:" + width + ";");
                element.innerHTML = entry + "| ";
                rowElement.append(element);
            }
            container.append(rowElement);
        }
    }
}

/**
 * Method: guid
 *
 * Description: Get a guid
 *
 * @author Carl Anderson
 */
Prime.prototype.guid = function() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
        s4() + '-' + s4() + s4() + s4();
}
