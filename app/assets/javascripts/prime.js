Prime = function() {
    this.requests = [];
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

    this.requests.push(data);
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
Prime.prototype.updateReceived = function(data){
    console.log(data);
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