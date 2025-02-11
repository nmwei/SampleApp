//
//  GTVideoCoverView.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/11.
//

#import "GTVideoCoverView.h"
#import "AVFoundation/AVFoundation.h"

@interface GTVideoCoverView()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property(nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;
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
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((size.width - 50) / 2, (size.height - 50) / 2, 50, 50)];
            _playButton;
        })];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    
    return self;
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_videoItem removeObserver:self forKeyPath:@"status"];
}

#pragma mark - public method

-(void) layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *) videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.backgroundColor = [UIColor redColor];
    _videoUrl = videoUrl;
};

#pragma mark - private method

- (void)_tapToPlay {
    NSURL *videoUrl = [NSURL URLWithString:_videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:videoUrl];
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    // _avPlayer = [AVPlayer playerWithURL:videoUrl]; 可以使用url直接生成avPlayer
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:_playerLayer];
    NSLog(@"");
}

-(void) _handlePlayEnd {
    [_playerLayer removeFromSuperlayer];
    _videoItem = nil;
    _avPlayer = nil;
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([keyPath isEqualToString:@"status"]) {
        if(((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            [_avPlayer play];
        } else {
            NSLog(@"");
        }
    }
}

@end
