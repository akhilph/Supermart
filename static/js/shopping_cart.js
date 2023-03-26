$(".select2").select2({ theme: "bootstrap4" ,width:'resolve'});

const counter = (function () {
    const getCount = () => {
        return parseInt($("#item-count").val());
    };
    const incrementByOne = () => {
        let value = parseInt($("#item-count").val());
        value++;
        $("#item-count").val(value);
    };
    const decrementByOne = () => {
        let value = parseInt($("#item-count").val());
        value--;
        value = value > 0 ? value : 0;
        $("#item-count").val(value);
    };
    return {
        getCount,
        incrementByOne,
        decrementByOne,
    };
})();

const order = (function () {
    const addproduct = (id, product, price,stock) => {
        if (!alreadyexist(product)) {
            id = parseInt(id);
            price = parseFloat(price);
            counter.incrementByOne();

            let row = `<tr>
                <td class="sl-no"> ${counter.getCount()}</td>
                <td class="product-id">${id}</td>
                <td class="product_name">${product}</td>
                <td class='uprice'>${price}</td>
                <td><input type ="number" min="1" max="${stock}" class="form-control form-control-sm" value="1" name="pcount"/></td>
                <td class="ptotal">
                    ${price}
                </td>
                <td>
                Stock :
                ${stock}
                    <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </td>
                </tr>`;
            $("#order-product-items").append(row);
            computeGrandTotal()
            
        }
    };
    const alreadyexist = (product) => {
       let status = false
        $("#order-product-items")
            .find("tr")
            .each(function (i, el) {
                var td = $(this).find("td[class='product_name']");
                item = $(td).text()
                if(item==product) status =true;
            });
           
        return status;
    };
    const computeGrandTotal = () =>{
        let gtotal= 0.0;
        $("#order-product-items")
            .find("tr")
            .each(function (i, el) {
                var td = $(this).find("td[class='ptotal']");
                price = parseFloat($(td).text())
                gtotal+=price
            });
            
            $('th.order_total_price').html(gtotal)
            return gtotal;
    }
    const resetSerialNo = () =>{
        $("#order-product-items")
            .find("tr")
            .each(function (i, el) {
                var td = $(this).find("td[class='sl-no']").text(i+1);
                
            });
    }
    const ordertoJson =() =>{
        corder ={};
        corder['mobile'] = $('#mobilenumer').val()
        corder['grand_total'] = order.computeGrandTotal();
        corder['items'] = []
        $("#order-product-items")
            .find("tr")
            .each(function (i, el) {
                orderitem ={}
                orderitem['id'] = $(this).find("td[class='product-id']").text();
                orderitem['product'] = $(this).find('td[class="product_name"]').text()
                orderitem['uprice'] =parseFloat( $(this).find("td[class='uprice']").text());
                orderitem['count'] = parseInt(($(this).find('input')).val());
                orderitem['total'] = parseFloat($(this).find("td[class='ptotal']").text());
                corder.items.push(orderitem)
            });
            return corder;
    }
    const isEmpty = () =>
    {
        return ($("#order-product-items").length == 0)
    }
    return {
        addproduct,
        alreadyexist,
        computeGrandTotal,
        resetSerialNo,
        ordertoJson,
        isEmpty
    };
})();

$("table").on("change", 'input[type="number"]', function (event) {
    let element = event.target;
    let max_value =parseInt($(element).attr('max'));
    let count = parseInt($(element).val());
    count= (count>max_value)? max_value:count;
    $(element).val(count)
    let price = parseFloat($(element).closest("td").prev().html());
    total = count * price;
    $(element).closest("td").next().html(total);
    order.computeGrandTotal()
});
$("table").on("click", "button", function (event) {
    let element = event.target;
    element.closest("tr").remove();
    counter.decrementByOne()
    order.computeGrandTotal();
    order.resetSerialNo()
});


