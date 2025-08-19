//  ProductsTableViewController.ets
//  GoodAsOldPhones
//
//  Copyright © 2016 Code School. All rights reserved.

import router from '@ohos.router';
import type { BusinessError } from '@ohos.base';
import { Product, products } from './ProductsModel';

@Entry
@Component
struct ProductsTableViewController {
  private products: Array<Product> = products;
  private identifer: string = "productCell";

  aboutToAppear() {
    console.log('ProductsTableViewController aboutToAppear');
    console.log('Products count:', this.products.length);
    console.log('Products:', JSON.stringify(this.products));
  }

  build() {
    Column({ space: 0 }) {
      // Header
      Text('Good As Old Phones')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#F5F5F5')
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding(20)
      
      // Product list
      List({ space: 8 }) {
        ForEach(this.products, (product: Product, index: number) => {
          ListItem() {
            Row() {
              // Product image
              if (product.cellImageName) {
                Image($r(`app.media.${product.cellImageName}`))
                  .width(60)
                  .height(60)
                  .borderRadius(8)
                  .margin(10)
              }
              
              // Product info
              Column() {
                Text(product.name)
                  .fontSize(18)
                  .fontWeight(FontWeight.Medium)
                  .margin({ bottom: 4 })
                
                Text(`点击查看详情`)
                  .fontSize(14)
                  .fontColor('#666666')
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
              .margin({ left: 10 })
              
              // Arrow indicator
              Text('>')
                .fontSize(20)
                .fontColor('#CCCCCC')
                .margin({ right: 20 })
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .alignItems(VerticalAlign.Center)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .padding(10)
            .shadow({
              radius: 4,
              color: '#00000020',
              offsetX: 0,
              offsetY: 2
            })
          }
          // MARK: - View Transfer
          .onClick(() => {
            // Equivalent to prepareForSegue
            router.pushUrl({
              url: 'pages/ProductView',
              params: { productIndex: index }
            }).catch((err: BusinessError) => console.error("Navigation failed", err));
          })
        })
      }
      .width('100%')
      .layoutWeight(1) // Fill available space
      .padding(16)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F8F8F8')
  }
}