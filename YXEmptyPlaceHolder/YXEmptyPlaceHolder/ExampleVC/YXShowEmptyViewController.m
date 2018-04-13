//
//  YXShowEmptyViewController.m
//  YXEmptyPlaceHolder
//
//  Created by Color on 2018/4/12.
//  Copyright © 2018年 ColorBlue. All rights reserved.
//

#import "YXShowEmptyViewController.h"
#import "UIScrollView+YXEmptyPlaceHolder.h"
#import "YXEmptyView.h"
@interface YXShowEmptyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataSourceArr;

@end

@implementation YXShowEmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"试一试";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.emptyView = [YXEmptyView createEmptyViewWithImgStr:@"empty_yy" describeStr:@"没数据了"];
    [self dataFromSever];
}

-(void)dataFromSever{
    [self.tableView yx_startLoading];
    dispatch_queue_t queue = dispatch_queue_create("fasdfsdf", DISPATCH_QUEUE_SERIAL);
    __block typeof (self) weakSelf = self;
    dispatch_async(queue, ^{
        
        [weakSelf.dataSourceArr addObject:@"1"];
       
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            [self.tableView yx_endLoading];
        });
        
    });
    
}
- (IBAction)clearData:(id)sender {
    [self.dataSourceArr removeAllObjects];
    [self.tableView reloadData];
}
- (IBAction)insertData:(id)sender {
    
    [self.dataSourceArr addObject:@"插入"];
    [self.tableView reloadData];
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataSourceArr[indexPath.row];
    return cell;
    
}

#pragma mark -

-(NSMutableArray *)dataSourceArr
{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}


@end
