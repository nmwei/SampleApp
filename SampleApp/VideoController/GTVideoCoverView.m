//
//  GTVideoCoverView.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/11.
//

#import "GTVideoCoverView.h"
#import "GTVideoPlayer.h"
#import "GTVideoToolbar.h"

@interface GTVideoCoverView()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;
@property(nonatomic, copy, readwrite) GTVideoToolbar *toolbar;

@end

@implementation GTVideoCoverView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        CGSize size = frame.size;
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, size.width, size.height - GTVideoToolbarHeight)];
            _coverView;
        })];
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((size.width - 50) / 2, (size.height - 50 - GTVideoToolbarHeight) / 2, 50, 50)];
            _playButton;
        })];
        
        [self addSubview:({
            _toolbar = [[GTVideoToolbar alloc]initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, GTVideoToolbarHeight)];
            _toolbar;
        })];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
    }
    
    return self;
}

-(void) dealloc {
    
}

#pragma mark - public method

-(void) layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *) videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.backgroundColor = [UIColor redColor];
    _videoUrl = videoUrl;
    [_toolbar layoutWithModel:nil];
};

#pragma mark - private method

- (void)_tapToPlay {
    [[GTVideoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];
}

@end
