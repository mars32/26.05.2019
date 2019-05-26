class Product {
    constructor( name , price, img) {
        this.name = name;
        this.price = price;
        this.img = img ;
        this.el = document.querySelector('.block-product-list.flex-cont');
        
    }

    renderProduct() {
        let newProductBlock =document.createElement('div');
        newProductBlock.classList.add('block-product-list__card-product');
        newProductBlock.innerHTML = `
            <div class="block-product-list__card-product__img" style="background-image: url(../images/${this.img})"></div>
            <p class="block-product-list__card-product__name">${this.name}</p>
            <p class="block-product-list__card-product__price">${this.price}</p>
        `;
        this.el.appendChild(newProductBlock);
    }
}



class Catalog {
    constructor() {
        this.el = document.querySelector('.block-product-list.flex-cont');
    }
    cleanCatalog() {
        this.el.innerHTML = '';
    }
    preloaderOn() {
        let preloader = document.createElement('div');
        preloader.classList.add('preloader');
        this.el.appendChild(preloader);
    }
    preloaderOff() {
        this.cleanCatalog();
    }
    renderCatalog(id) {

        // let id = `${window.location.search}`;
        // console.log(id);

        this.cleanCatalog();
        this.preloaderOn();
        
        let xhr = new XMLHttpRequest;                         //создаем обект для для запроса
        xhr.open('GET', `../hendlers/catalogHendler.php${id}` );   // указываем метод и путь
        xhr.send();

        xhr.addEventListener('load', () => {
            this.preloaderOff();

            let data = JSON.parse(xhr.responseText);       // JSON.parse - приводит ответ в читабельный вид

            data.forEach(function(value) {
                let newProduct = new Product( value.product_name , value.product_prise , value.	product_img);
                newProduct.renderProduct();
            });
        });
        
    }
    
};

let catalog = new Catalog();

// let cats = '';
// if (window.location.search != '') {
//     cats = window.location.search;
// } else {
//     cats = '?id=1';
// }

// тернарный оператор
let cats = (window.location.search != '') ?  window.location.search  :  '?id=1'  ;


catalog.renderCatalog(cats);

let subCats = document.querySelector('[name="categori"]');

subCats.addEventListener('change' , function() {
    let subCatsId = subCats.value;
    subCatsId =  `?id=${subCatsId}`;
    catalog.renderCatalog(subCatsId);
    
});


