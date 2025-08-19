// ContactViewController.ets
// Original Swift code: GoodAsOldPhones/ContactViewController.swift
// Copyright © 2016 Code School. All rights reserved.

@Entry
@Component
struct ContactViewController {
  @State private scrollHeight: number = 800;

  build() {
    Column() {
      // Scrollable content area
      Scroll() {
        Column()
          .width('100%')
          .height(this.scrollHeight)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}