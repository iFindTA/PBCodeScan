//
//  PBCodeScanProfile.h
//  PBCodeScan
//
//  Created by nanhujiaju on 2017/9/8.
//  Copyright © 2017年 nanhujiaju. All rights reserved.
//

#import <PBBaseClasses/PBBaseProfile.h>

@interface PBCodeScanProfile : PBBaseProfile

/**
 handle with code scan event
 
 @param completion callback block
 */
- (void)handleScanCodeWithCompletion:(void (^_Nullable)(NSError * _Nullable code))completion;

@end
