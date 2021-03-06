//
//  ViewController.m
//  RangeSliderDemo
//
//  Created by Tom Thorpe on 31/03/2015.
//  Copyright (c) 2015 tomthorpe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSlider;
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSliderCurrency;
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSliderCustom;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //standard rsnge slider
    self.rangeSlider.delegate = self;
    self.rangeSlider.minValue = 0;
    self.rangeSlider.maxValue = 200;
    self.rangeSlider.selectedMinimum = 50;
    self.rangeSlider.selectedMaximum = 150;
    self.rangeSlider.barPadding = 16.0f;
    self.rangeSlider.barThickness = 8.0f;
    self.rangeSlider.barCornerRadius = 4.0f;
    self.rangeSlider.barHandleDiameter = 32.0f;
    
    self.rangeSlider.handleColor = [UIColor blueColor];
    self.rangeSlider.barColor = [UIColor purpleColor];
    
    self.rangeSlider.handleBorderThickness = 2.0f;
    self.rangeSlider.handleBorderColor = [UIColor greenColor];
    
    
    //currency range slider
    self.rangeSliderCurrency.delegate = self;
    self.rangeSliderCurrency.minValue = 50;
    self.rangeSliderCurrency.maxValue = 150;
    self.rangeSliderCurrency.selectedMinimum = 50;
    self.rangeSliderCurrency.selectedMaximum = 150;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    self.rangeSliderCurrency.numberFormatterOverride = formatter;
    
    //custom number formatter range slider
    self.rangeSliderCustom.delegate = self;
    self.rangeSliderCustom.minValue = 0;
    self.rangeSliderCustom.maxValue = 100;
    self.rangeSliderCustom.selectedMinimum = 40;
    self.rangeSliderCustom.selectedMaximum = 60;
    NSNumberFormatter *customFormatter = [[NSNumberFormatter alloc] init];
    customFormatter.positiveSuffix = @"B";
    self.rangeSliderCustom.numberFormatterOverride = customFormatter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TTRangeSliderViewDelegate
-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{
    if (sender == self.rangeSlider){
        NSLog(@"Standard slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
    else if (sender == self.rangeSliderCurrency) {
        NSLog(@"Currency slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
    else if (sender == self.rangeSliderCustom){
        NSLog(@"Custom slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
}

- (void)rangeSlider:(TTRangeSlider *)sender didEndTouchWithSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum {
    NSLog(@"Did end touching slider Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
}

@end
