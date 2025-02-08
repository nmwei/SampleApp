//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

// 任何遵守 GTNormalTableViewCellDelegate 协议的类都必须实现这个方法。这个方法接受两个参数：
    // tableViewCell: 类型为 UITableViewCell，代表触发该事件的单元格。
    // deleteButton: 类型为 UIButton，代表被点击的删除按钮。
- (void) tableViewCell: (UITableViewCell *) tableViewCell clickDeleteButton: (UIButton *) deleteButton;
@end

@interface GTNormalTableViewCell : UITableViewCell
@property(nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void) layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
