//
//  GTNewsViewController.m
//  SampleApp
//
//  Created by 倪梦威 on 2022/11/15.
//
#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTMediator.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"
#import "GTListItem.h"

@interface GTNewsViewController ()<UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray *dataArray;
@property(nonatomic, strong, readwrite) GTListLoader *listLoader;
@end

@implementation GTNewsViewController

#pragma mark - lefe cycle

- (instancetype) init {
    self = [super init];
    if(self) {}
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    // 使用 Auto Layout 来设置约束
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_tableView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:viewsDictionary]];
    
    // 如果你的视图控制器包含 UITabBar, 需要额外处理底部间距
    if (self.tabBarController) {
        UIEdgeInsets tabSafeAreaInsets = self.tabBarController.tabBar.safeAreaInsets;
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-tabSafeAreaInsets.bottom].active = YES;
    }
    
    self.listLoader = [[GTListLoader alloc] init];
    
    __weak typeof (self) wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(wself)strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    
    __kindof UIViewController *controller = [GTMediator detailViewControllerWithUrl:item.articleUrl];
    
    controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniquekey];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"id"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    
    
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void) tableViewCell: (UITableViewCell *) tableViewCell clickDeleteButton: (UIButton *) deleteButton {
//    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.frame];
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil]; //将deleteButton坐标系转化为Window的坐标系
//
//
//    __weak typeof (self) wself = self; //创建一个弱引用。弱引用不会增加对象的引用计数，因此不会阻止对象被释放
//    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
//        __strong typeof(wself)strongSelf = wself; // 创建一个强引用。强引用会增加对象的引用计数，直到引用计数为零时，对象才会被销毁
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell: tableViewCell]] withRowAnimation:(UITableViewRowAnimationAutomatic)];
//    }];
}
@end
