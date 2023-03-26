const cart = (function() {
    let email = $('#cart_email').val()

    if (localStorage.getItem(`${email}-cart`) === null) {
        shop_cart = {}
        shop_cart['items'] = []
        localStorage.setItem(`${email}-cart`, JSON.stringify(shop_cart))
        $('.total_cart_items').html(0)
    } else {
        shop_cart = JSON.parse(localStorage.getItem(`${email}-cart`))
        $('.total_cart_items').html(shop_cart.items.length)
    }

    const cartItemCount=() =>{
        shop_cart = JSON.parse(localStorage.getItem(`${email}-cart`))
        return shop_cart.items.length
    }

    const isAlreadyAdded = (product_id) => {
        id = parseInt(product_id)
        shop_cart = localStorage.getItem(`${email}-cart`);
        return shop_cart.includes(`"id":${id}`);
    }
    const getProductName = (product_id) => {
        id = parseInt(product_id)
        shop_cart = JSON.parse(localStorage.getItem(`${email}-cart`));
       // shop_cart
    }
    const addproduct = (product_id, product_name, uprice, quantity, stock, product_img) => {
        if (!isAlreadyAdded(product_id)) {

            shop_cart = JSON.parse(localStorage.getItem(`${email}-cart`))
            let item = {}
            item['id'] = parseInt(product_id)
            item['product'] = product_name
            item['quantity'] = parseInt(quantity)
            item['uprice'] = parseFloat(uprice)
            item['stock'] = parseInt(stock)
            item['img'] = product_img
            shop_cart.items.push(item)
            localStorage.setItem(`${email}-cart`, JSON.stringify(shop_cart))
            $('.total_cart_items').html(shop_cart.items.length)
        } else {
            alert('The Product is already added')
        }

    }
    const getAllProduct = () => {
        shop_cart = JSON.parse(localStorage.getItem(`${email}-cart`))
        return shop_cart
    }
    const findItemIndex = (product_id) => {
        position = -1;
        shop_cart = JSON.parse(localStorage.getItem(`${email}-cart`))
        $(shop_cart.items).each(function(index,item){
            if(item.id==product_id){
                position=index
            } 
        })
        return position
    }
    const updateProductCount = (id,count) =>{
        shop_cart = JSON.parse(localStorage.getItem(`${email}-cart`))
        index = findItemIndex(id)
        if(index >= 0 ){
            shop_cart.items[index].quantity=count
        }
        localStorage.setItem(`${email}-cart`,JSON.stringify(shop_cart))
    }
    const removeItem = (product_id) => {
        shop_cart = JSON.parse(localStorage.getItem(`${email}-cart`))
        index = findItemIndex(product_id)
        shop_cart.items.splice(index,1)
        localStorage.setItem(`${email}-cart`,JSON.stringify(shop_cart))
        $('.total_cart_items').text(cartItemCount())
        if(!cartItemCount()){
           $('#ordernow').attr('disabled','true')
        }
    }
    return {
        addproduct,
        isAlreadyAdded,
        getAllProduct,
        removeItem,
        cartItemCount,
        updateProductCount,
        findItemIndex

    }
}())

const order = (function() {
    const updategrandtotal = () => {
        total = 0.0;
        $('td[class="ptotal"]').each(function(i, val) {
            total += parseFloat($(this).text())
        })
        $('.gptotal').html(total)
        return total
    }
    const populateItems = () => {
        pcart = cart.getAllProduct()
        if (pcart.items.length == 0) {
            $('#ordernow').attr('disabled', true)
        } else {
            $('#cart-order-items').html("");
            $('#ordernow').attr('disabled', false)
        }
        $.each(pcart.items, function(index, item) {

            serialno = index + 1;
            product_id = item.id
            product = item.product;
            quantity = item.quantity;
            uprice = item.uprice;
            stock = item.stock

            tr = `<tr>    
                    <td>${serialno}</td>
                    <td>
                    <img src=${item.img} width="64px"  class="img-responsive"/>
                    <span class="pname">${product}</span>
                    <input type="hidden" name="product_id" value="${product_id}" />
                    </td>
                    <td class='pquanitity'><input type="number" min="1" max="${stock}" value="${quantity}" class="form-control form-control-sm" /></td>
                    <td class='uprice'>${uprice}</td>
                    <td class='ptotal'>${uprice * quantity}</td>
                    <td> 
                    <button type="button" class="close" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </td>
                    </tr>`
            $('#cart-order-items').append(tr)
        })
        updategrandtotal()
    }

    const getOrderItems = () => {
        custorder = []
        rows = $('#cart-order-items').find('tr')
        $(rows).each(function(index, Item) {
            item = {}
            item['slno'] = index + 1;
            item['product'] = $(Item).find('span[class="pname"]').text()
            item['product_id'] = parseInt($(Item).find('input[name="product_id"]').val())
            item['quanitity'] =parseInt($(Item).find("input[type='number']").val());
            item['uprice'] = parseInt($(Item).find("td[class='uprice']").text())
            item['ptotal'] = parseFloat($(Item).find("td[class='ptotal']").text())
            custorder.push(item)
        });
        return custorder
    }
    
    $('table').on('change', 'input[type="number"]', function() {
        tr = $(this).closest('tr');
        quantity = parseInt($(this).val())
        id = parseInt($(tr).find('input[name="product_id"]').val())
        stock = parseInt($(this).attr('max'))

        quantity = (quantity > stock) ? stock : quantity
        quantity = (quantity < 1) ? 1 : quantity
        $(this).val(quantity)
        cart.updateProductCount(id,quantity);
        price = parseFloat($(tr).find('td[class="uprice"]').text())
        ptotal = quantity * price
        $(tr).find('td[class="ptotal"]').html(ptotal)
        updategrandtotal()
    })
    $('table').on('click', '.close', function() {
        row = $(this).closest('tr')
        id = parseInt($(row).find('input[name="product_id"]').val())
        cart.removeItem(id)
        row.remove()
        order.updategrandtotal()
    })
    return {
        populateItems,
        updategrandtotal,
        getOrderItems
    }
}())