//
//  GTVideoCoverView.h
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell

-(void) layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *) videoUrl;

@end

NS_ASSUME_NONNULL_END
