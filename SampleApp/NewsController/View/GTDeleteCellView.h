//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/// 点击出现的cell浮层
@interface GTDeleteCellView : UIView


/// 点击出现输出cell确认浮层
/// - Parameters:
///   - point: 点击位置
///   - clickBlock: 点击后的操作
-(void) showDeleteViewFromPoint:(CGPoint) point clickBlock: (dispatch_block_t) clickBlock;

@end

NS_ASSUME_NONNULL_END
