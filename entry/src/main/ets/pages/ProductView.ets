//  ProductView.ets
//  GoodAsOldPhones

import router from '@ohos.router';
import { Product, products } from '../ProductsModel';

@Entry
@Component
struct ProductView {
  @State private product: Product | null = null;

  aboutToAppear() {
    interface ProductViewParams { productIndex?: number }
    const params: ProductViewParams = router.getParams() as ProductViewParams;
    const index = typeof params?.productIndex === 'number' ? params.productIndex : -1;
    if (index >= 0 && index < products.length) {
      this.product = products[index];
    } else {
      this.product = null;
    }
  }

  build() {
    Column() {
      if (this.product) {
        // Header with product name
        Text(this.product.name)
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin(20)

        // Fullscreen image
        if (this.product.fullscreenImageName) {
          Image($r(`app.media.${this.product.fullscreenImageName}`))
            .width('90%')
            .height(300)
            .margin(10)
        }
      } else {
        Text('Product not found')
          .fontSize(18)
          .margin(20)
      }
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}


