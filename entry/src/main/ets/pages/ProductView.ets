//  ProductView.ets
//  GoodAsOldPhones

import router from '@ohos.router';
import assertNull from '@ohos/hypium/src/main/module/assert/assertNull';
import { Product, products } from '../model/ProductsModel';

@Entry
@Component
struct ProductView {
  @State private product: Product | null = null;

  aboutToAppear() {
    interface ProductViewParams { productIndex?: number }
    const params: ProductViewParams = router.getParams() as ProductViewParams;
    const index = typeof params?.productIndex === 'number' ? params.productIndex : -1; // 默认显示第一个产品
    if(index == -1)
        assertNull();

    if (index >= 0 && index < products.length) {
      this.product = products[index];
    }
  }

  build() {
    Column() {
      if (this.product) {
        // Header with back button and product name
        Row() {
          Button('← 返回')
            .fontSize(16)
            .backgroundColor('#007AFF')
            .borderRadius(8)
            .onClick(() => {
              router.back();
            })
          
          Text(this.product.name)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 20 })
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .margin(20)

        // Fullscreen image with better sizing
        if (this.product.fullscreenImageName) {
          Image($r(`app.media.${this.product.fullscreenImageName}`))
            .width('100%')
            .height('60%')
            .objectFit(ImageFit.Contain)
            .margin(10)
        }

        // Product description
        Text(`产品名称: ${this.product.name}`)
          .fontSize(18)
          .margin(20)
      } else {
        Column() {
          Button('← 返回')
            .fontSize(16)
            .backgroundColor('#007AFF')
            .borderRadius(8)
            .onClick(() => {
              router.back();
            })
          
          Text('Product not found')
            .fontSize(18)
            .margin(20)
        }
        .alignItems(HorizontalAlign.Center)
      }
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}


