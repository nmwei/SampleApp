//
//  GTVideoCoverView.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/11.
//

#import "GTVideoCoverView.h"

@interface GTVideoCoverView()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;

@end

@implementation GTVideoCoverView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        CGSize size = frame.size;
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, size.width, size.height)];
            _coverView;
        })];
        
        [self addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((size.width - 50) / 2, (size.height - 50) / 2, 50, 50)];
            _playButton;
        })];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
    }
    
    return self;
}

#pragma mark - public method

-(void) layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *) videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.backgroundColor = [UIColor redColor];
    _videoUrl = videoUrl;
};

#pragma mark - private method

- (void)_tapToPlay {
    NSLog(@"");
}

@end
