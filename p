import React, { PropTypes } from 'react';
import { connect } from 'react-redux';
import { Row, Col, Icon, Popover, Button, Table, Card } from 'antd';
import { getProductInfo } from '../../actions/product'
import CIAChart from '../chart';
import CIATable from '../table';
import './style.css';

class Product extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			compareAreaStatus: {
				my: {
					//标题合并列数
					colSpan: '3',
					//产品大类偏离，合并列
					lastRowColSpan: '3',
					iconType: 'img plus',
					iconTypeDis: 'img minus',
					display: 'none',
					class: 'hideArea',
					DisSpaceFlag: true,
					background: "#ebfbff"
				},
				city: {
					//标题合并列数
					colSpan: '3',
					//产品大类偏离，合并列
					lastRowColSpan: '3',
					iconType: 'img plus',
					iconTypeDis: 'img minus',
					display: 'none',
					class: 'hideArea',
					DisSpaceFlag: true,
					background: "#fff"
				},
				department: {
					//标题合并列数
					colSpan: '3',
					//产品大类偏离，合并列
					lastRowColSpan: '3',
					iconType: 'img plus',
					iconTypeDis: 'img minus',
					display: 'none',
					class: 'hideArea',
					DisSpaceFlag: true,
					background: "#fffdde"
				},
				oversea: {
					//标题合并列数
					colSpan: '3',
					//产品大类偏离，合并列
					lastRowColSpan: '3',
					iconType: 'img plus',
					iconTypeDis: 'img minus',
					display: 'none',
					class: 'hideArea',
					DisSpaceFlag: true,
					background: "#fffdde"
				}
			},

			tableData: this.getTableData(),
			//显示折扣的类型索引
			categoriesShowDataType: new Map()
		};
		this.compareType = {
			my: "my",
			city: "city",
			department: "department",
			oversea: "oversea"
		}
		this.showChart = this.showChart.bind(this);
		this.showTable = this.showTable.bind(this);
		this.generateTitleCompareAreaRowSecond = this.generateTitleCompareAreaRowSecond.bind(this);
	}

	//组件完成加载业务数据
  // 	componentDidMount() {
	// 	this.props.dispatch(getProductInfo());
	// }

	componentWillReceiveProps(nextProps) {
		if(this.props.BusinessId !==nextProps.BusinessId){
			this.props.dispatch(getProductInfo());
		}
	}

	//准备表格数据
	getTableData() {
		let titleNames = { my: { value: "本客户", text: "历史商务比较" }, city: { value: "广州", text: "同规模历史商务比较" }, department: { value: "政务拓展部", text: "同规模历史商务比较" },oversea: { value: "同签约客户", text: "历史商务比较" } }
		let compareInfo = {
			//my平均成交折扣
			averageDiscount: "3%(四个)",
			//折扣范围
			discountRange: "3.3%-3.1%",
			//my商务偏差
			commercialOffset: "-1.8",
			commercialOffsetRatio: "PCT(4%)",

			//my覆盖率
			fractionOfCoverage: "80.2%",
			//my友商
			businessFriend: "H3C",
			//my型号
			model: "WLAN",
			//my折扣
			discount: "3.09%-4.23%",
			DisMinFlag: false
		};

		let compareInfo2 = {
			//my平均成交折扣
			averageDiscount: "2%(四个)",
			//折扣范围
			discountRange: "2.3%-2.1%",
			//my商务偏差
			commercialOffset: "1.8",
			commercialOffsetRatio: "PCT(4%)",
			//my覆盖率
			fractionOfCoverage: "70.2%",
			//my友商
			businessFriend: "H3C",
			//my型号
			model: "WLAN",
			//my折扣
			discount: "3.09%-4.23%",
			DisMinFlag: true
		};


		let OneCategories = {
			//产品大类
			categories: "储存",
			categoriesRatio: "(34.9%)",
			categoriesLevel: "BU级",
			//产品系列
			series: "18500",
			seriesRatio: "(65.0%)",
			//申请折扣
			applicationDiscount: "1.2%",
			applicationDiscountFlag: false,
			//本客户历史商务比较数据
			my: compareInfo,
			city: compareInfo,
			department: compareInfo,
			oversea: compareInfo
		}

		let OneDisconutCategories = {
			//产品大类
			categories: "储存",
			categoriesRatio: "(34.9%)",
			categoriesLevel: "Dis",
			//产品系列
			series: "18500",
			seriesRatio: "(65.0%)",
			//申请折扣
			applicationDiscount: "1.2%Dis",
			applicationDiscountFlag: true,
			//本客户历史商务比较数据
			my: compareInfo,
			city: compareInfo,
			department: compareInfo,
			oversea: compareInfo
		}

		let TwoCategories = {
			//产品大类
			categories: "2储存",
			categoriesRatio: "(34.9%)",
			categoriesLevel: "BU级",
			//产品系列
			series: "28500",
			seriesRatio: "(85.0%)",
			//申请折扣
			applicationDiscount: "1.2%",
			applicationDiscountFlag: false,
			//本客户历史商务比较数据
			my: compareInfo,
			city: compareInfo2,
			department: compareInfo2,
			oversea: compareInfo2
		}

		let TwoDisconutCategories = {
			//产品大类
			categories: "2储存",
			categoriesRatio: "(34.9%)",
			categoriesLevel: "Dis",
			//产品系列
			series: "28500",
			seriesRatio: "(85.0%)",
			//申请折扣
			applicationDiscount: "1.2%Dis",
			applicationDiscountFlag: false,
			//本客户历史商务比较数据
			my: compareInfo,
			city: compareInfo2,
			department: compareInfo2,
			oversea: compareInfo2
		}

		let tableRows = [
			[
				{
					discount: OneDisconutCategories,
					common: OneCategories
				},
				{
					discount: OneDisconutCategories,
					common: OneCategories
				},
				{
					discount: OneDisconutCategories,
					common: OneCategories
				}
			],
			[
				{
					discount: TwoDisconutCategories,
					common: TwoCategories
				},
				{
					discount: TwoDisconutCategories,
					common: TwoCategories
				},
				{
					discount: TwoDisconutCategories,
					common: TwoCategories
				}
			]

		];

		return {
			titleNames: titleNames,
			tableRows: tableRows
		}
	}

	
	getStandardData(businessData){
		//按产品大类,对业务数据进行分组
		const groupMap = getGroupDataFromRows("ProductCategory",businessData);
	    
		let titleNames = { my: { value: "本客户", text: "历史商务比较" }, city: { value: "广州", text: "同规模历史商务比较" }, department: { value: "政务拓展部", text: "同规模历史商务比较" },oversea: { value: "同签约客户", text: "历史商务比较" } }
		const tableData = {
			titleNames: titleNames,
			tableRows:[]
		}
		//遍历每个产品大类数据,生成折扣和非折扣的数据
		for (const [key, value] of groupMap) {
			const productSeriesGroupMap = this.getGroupDataFromRows("ProductSeries",value);
			const gruopRows = this.getProductRowsInfoFromData(productSeriesGroupMap);
			tableData.tableRows.push(gruopRows);
		}
		return 	tableData;
	}

	getProductRowsInfoFromData(productSeriesGroupMap){
		const rows = []; 
		for (const [key, value] of productSeriesGroupMap) {
			const oneRow = {
				discount: {},
				common: {}
			}
			if(key === "GP"){
				oneRow.common = value;	
			}
			if(key === "折扣"){
				oneRow.discount = value;	
			}
			rows.push(oneRow);						
		}
	}

	

	getGroupDataFromRows(groupFlag,rows){
		const groupMap = new Map();
		for(const item of rows){
			if(groupMap.has(item[groupFlag])){
				const groupsData = groupMap.get(item[groupFlag]);
				groupsData.push(item);
			}else{
				const groupsData = [];
				groupsData.push(item);
				groupMap.set(item[groupFlag],groupsData);
			}
		}
		return groupMap;
	}
	

	//显示隐藏区域切换
	showOrHideFirendInfo(type, e) {
		var compareAreaStatus = this.state.compareAreaStatus[type];
		compareAreaStatus.colSpan = compareAreaStatus.colSpan == '6' ? '3' : '6';
		compareAreaStatus.iconType = compareAreaStatus.iconType == 'img minus' ? 'img plus' : 'img minus';
		compareAreaStatus.display = compareAreaStatus.display == 'none' ? '' : 'none';
		compareAreaStatus.class = compareAreaStatus.class == 'showArea' ? 'hideArea' : 'showArea';
		compareAreaStatus.lastRowColSpan = compareAreaStatus.lastRowColSpan == '3' ? '6' : '3';

		this.setState({
			compareAreaStatus: this.state.compareAreaStatus
		});
		//alert(1);
		//this.setState({author: e.target.value});
	}

	showOrHideDisSpace(type, e) {
		var compareAreaStatus = this.state.compareAreaStatus[type];
		compareAreaStatus.iconTypeDis = compareAreaStatus.iconTypeDis == 'img minus' ? 'img plus' : 'img minus';
		compareAreaStatus.DisSpaceFlag = !compareAreaStatus.DisSpaceFlag;
		this.setState({
			compareAreaStatus: this.state.compareAreaStatus
		});
	}

	//选择折扣和普通下拉框响应事件
	showDiscountOrCommonData(index, e) {
		this.state.categoriesShowDataType.set(index, e.target.value);
		this.setState({
			categoriesShowDataType: this.state.categoriesShowDataType
		});
	}

	showPanel(type, e) {

	}

	//动态生成数据行,对比区域的详细数据
	generateCompareHeaderArea(oneRow, type) {
		let tds = [];
		tds.push(<td style={{ background: this.state.compareAreaStatus[type].background }}>
			<Popover arrowPointAtCenter overlayClassName='popCard' placement="topLeft" title="" content={this.showChart()} trigger="click">
				<span className="clickItem">{oneRow[type].averageDiscount}</span>
			</Popover>
			<div className='space' />{this.state.compareAreaStatus[type].DisSpaceFlag ? oneRow[type].discountRange : ""}
			{oneRow[type].DisMinFlag ?
				<span style={{ position: 'relative' }} className='warning'>
					<br />
					历史最低
					<Icon className='img warning' />
				</span> : ""
			}
		</td>);
		tds.push(<td style={{ background: this.state.compareAreaStatus[type].background, color: oneRow[type].commercialOffset < 0 ? '#ed5f5f' : '#60b283' }}>{oneRow[type].commercialOffset}{oneRow[type].commercialOffsetRatio}</td>);
		tds.push(<td style={{ background: this.state.compareAreaStatus[type].background }}>
			<Popover arrowPointAtCenter overlayClassName='popCard' placement="topLeft" title="" content={this.showChart()} trigger="click">
				<span className="clickItem">{oneRow[type].fractionOfCoverage}</span>
			</Popover>
		</td>);
		tds.push(<td className={this.state.compareAreaStatus[type].class} style={{ background: this.state.compareAreaStatus[type].background }}><div >{oneRow[type].businessFriend}</div></td>);
		tds.push(<td className={this.state.compareAreaStatus[type].class} style={{ background: this.state.compareAreaStatus[type].background }}><div >{oneRow[type].model}</div></td>);
		tds.push(<td className={this.state.compareAreaStatus[type].class} style={{ background: this.state.compareAreaStatus[type].background }}><div >{oneRow[type].discount}</div></td>);
		return tds;
	}

	//动态生成表头对比区域第一行数据
	generateTitleCompareAreaRowOne(type) {
		let priceIcon;
		if(type === this.compareType.oversea){
			priceIcon = <Popover arrowPointAtCenter placement="bottom" title="" content={this.generateWorthTipInfoArea('电子政务')} trigger="click">
								<Icon className='mouseClickStyle img jiazhi' />
						</Popover>
		}
		
		return <th
			colSpan={this.state.compareAreaStatus[type].colSpan}><span className='table-header'>{this.state.tableData.titleNames[type].value}</span>{this.state.tableData.titleNames[type].text}
			<div className='space' >{priceIcon}</div>
			
			<span className={this.state.compareAreaStatus[type].class == 'showArea' ? 'hideArea' : 'showArea'}>友商信息1
				<Icon className={'mouseClickStyle ' + this.state.compareAreaStatus[type].iconType} onClick={this.showOrHideFirendInfo.bind(this, type)} />
			</span>
		</th>;
	}

	//动态生成表头对比区域第二行数据
	generateTitleCompareAreaRowSecond(type) {
		let tds = [];
		tds.push(<th rowSpan='2'>平均成交折扣/项目数量
          <Icon className={'mouseClickStyle ' + this.state.compareAreaStatus[type].iconTypeDis} onClick={this.showOrHideDisSpace.bind(this, type)} />
		</th>);
		tds.push(<th rowSpan='2'>商务偏差</th>);
		tds.push(<th rowSpan='2'>覆盖率
		<Popover arrowPointAtCenter placement="right" title="" content={this.generateHelp('Ratio')} trigger="click">
				<Icon className='mouseClickStyle img help' />
			</Popover></th>);
		tds.push(<th colSpan='3' className={this.state.compareAreaStatus[type].class}>
			<div>
				<span>友商信息</span>
				<Icon onClick={this.showOrHideFirendInfo.bind(this, type)} className={this.state.compareAreaStatus[type].iconType + ' mouseClickStyle'} />
			</div>
		</th>);
		return tds;
	}

	//动态生成表头对比区域第三行数据
	generateTitleCompareAreaRowThird(type) {
		let tds = [];
		tds.push(<th className={this.state.compareAreaStatus[type].class}><div>友商</div></th>);
		tds.push(<th className={this.state.compareAreaStatus[type].class}><div>型号</div></th>);
		tds.push(<th className={this.state.compareAreaStatus[type].class}><div>折扣</div></th>);
		return tds;
	}

	generateTips() {
		const columns = [
			{ title: '产品名称', dataIndex: 'pname', }
			, { title: '折扣分类名称', dataIndex: 'disname', }
			, { title: '折扣值', dataIndex: 'dis', }
		];
		const data = [
			{ key: '1', pname: 'CE128540', disname: "散光包1", dis: '3.99%', }
			, { key: '2', pname: 'S123465', disname: "散光包2", dis: '4.99%', }
			, { key: '3', pname: '7600散光包', disname: "散光包2", dis: '5.99%', }];

		return <div className='disTable'>
			<div style={{ width: '400px', height: '150px' }}>
				<Table columns={columns} dataSource={data} size="middle" pagination={false} />
			</div>
		</div>;
	}

	generateHelp(text) {
		return <div className='disTable'>
			<div style={{ width: '400px', height: '150px' }}>
				{text}
			</div>
		</div>;
	}

	generateWorthTipInfoArea(text) {
		return <div className='disTable'>
				<div style={{ width: '65x', height: '20px' }}>
					价值子行业
				</div>
				<div style={{ width: '65px', height: '20px',"color": "#A3E0FF" }}>
					{text}	
				</div>
			   </div>;
	}

	showChart() {
		return <div><CIAChart /></div>;
	}

	showTable(type) {
		let props = { type: type };
		return <div><CIATable {...props} /></div>;
	}

	render() {
		let rows = [];
		let {productData} = this.props;
    //console.log(productData);
		let rowsData = this.state.tableData.tableRows;


		for (let j = 0; j < rowsData.length; j++) {
			let oneCategoriesGroup = rowsData[j];
			for (let i = 0; i < oneCategoriesGroup.length; i++) {
				let oneRow;
				//判断是使用折扣数据,还是使用普通数据
				var dataType = this.state.categoriesShowDataType.get(j);
				if (dataType) {
					oneRow = oneCategoriesGroup[i][dataType];
				} else {
					oneRow = oneCategoriesGroup[i].discount;
				}
				let firstTd;
				//分组数据的首列需要合并单元格
				if (i == 0) {
					firstTd =
						<td rowSpan={oneCategoriesGroup.length}>
							<Popover arrowPointAtCenter overlayClassName='popCard' placement="topLeft" title="" content={this.showTable('Category')} trigger="click">
								<span className="clickItem big">{oneRow.categories}</span>
							</Popover>
							<br />
							{oneRow.categoriesRatio}<div className='space' />{oneRow.categoriesLevel}<br />
							<select onChange={this.showDiscountOrCommonData.bind(this, j)}>
								<option value='discount'>折扣</option>
								<option value='common'>普通</option>
							</select>
						</td>;
				}

				//分组中最后一条数据需要合并列
				if (i != oneCategoriesGroup.length - 1) {
					rows.push(
						<tr>
							{firstTd}
							<td>
								<Popover arrowPointAtCenter overlayClassName='popCard' placement="topLeft" title="" content={this.showTable('Series')} trigger="click">
									<span className="clickItem">{oneRow.series}</span>
								</Popover>
								<br />
								{oneRow.seriesRatio}
							</td>
							<td >
								{oneRow.applicationDiscount}
								{
									oneRow.applicationDiscountFlag ?
										<span style={{ position: 'relative' }} id={"clickArea" + i} className='product-tips'>
											<Popover arrowPointAtCenter placement="right" title="" content={this.generateTips()} trigger="click" getPopupContainer={() => document.getElementById("clickArea" + i)}>
												<Icon className='mouseClickStyle img notic' />
											</Popover>
										</span>
										: ""
								}
							</td>
							{this.generateCompareHeaderArea(oneRow, this.compareType.my)}
							{this.generateCompareHeaderArea(oneRow, this.compareType.city)}
							{this.generateCompareHeaderArea(oneRow, this.compareType.department)}
							{this.generateCompareHeaderArea(oneRow, this.compareType.oversea)}
						</tr>
					);
				} else {
					rows.push(<tr>
						{firstTd}
						<td>产品大类偏离
						<Popover arrowPointAtCenter placement="right" title="" content={this.generateHelp('Drift')} trigger="click">
								<Icon className='mouseClickStyle img help' />
							</Popover></td>
						<td >
						</td>
						<td style={{ background: this.state.compareAreaStatus.my.background }} colSpan={this.state.compareAreaStatus.my.lastRowColSpan}>
							{oneRow.series + " 申请总金额XXXX,低于此客户历史平均商务XXXX"}
						</td>
						<td style={{ background: this.state.compareAreaStatus.city.background }} colSpan={this.state.compareAreaStatus.city.lastRowColSpan}>
							{oneRow.series + " 申请总金额XXXX,低于此客户历史平均商务XXXX"}
						</td>
						<td style={{ background: this.state.compareAreaStatus.department.background }} colSpan={this.state.compareAreaStatus.department.lastRowColSpan}>
							{oneRow.series + " 申请总金额XXXX,低于此客户历史平均商务XXXX"}
						</td>
					    <td style={{ background: this.state.compareAreaStatus.oversea.background }} colSpan={this.state.compareAreaStatus.department.lastRowColSpan}>
							{oneRow.series + " 申请总金额XXXX,低于此客户历史平均商务XXXX"}
						</td>
					</tr>
					);
				}
			}
		}

		return (
			<div className="product">
				<table cellspacing="0" cellpadding="0" border="0" style={{ width: "100%","min-width": "1200px" }}>
					<thead>
						<tr>
							<th rowSpan='3'>产品大类<br />(金额占比)</th>
							<th rowSpan='3'>产品系列<br />(金额占比)</th>
							<th rowSpan='3'>申请折扣/GP
							<Popover arrowPointAtCenter placement="right" title="" content={this.generateHelp('GP')} trigger="click">
									<Icon className='mouseClickStyle img help' />
								</Popover></th>
							{this.generateTitleCompareAreaRowOne(this.compareType.my)}
							{this.generateTitleCompareAreaRowOne(this.compareType.city)}
							{this.generateTitleCompareAreaRowOne(this.compareType.department)}
							{this.generateTitleCompareAreaRowOne(this.compareType.oversea)}
						</tr>
						<tr>
							{this.generateTitleCompareAreaRowSecond(this.compareType.my)}
							{this.generateTitleCompareAreaRowSecond(this.compareType.city)}
							{this.generateTitleCompareAreaRowSecond(this.compareType.department)}
							{this.generateTitleCompareAreaRowSecond(this.compareType.oversea)}
						</tr>
						<tr>
							{this.generateTitleCompareAreaRowThird(this.compareType.my)}
							{this.generateTitleCompareAreaRowThird(this.compareType.city)}
							{this.generateTitleCompareAreaRowThird(this.compareType.department)}
							{this.generateTitleCompareAreaRowThird(this.compareType.oversea)}
						</tr>
					</thead>

					<tbody>
						{rows}
					</tbody>
				</table>
			</div>
		);
	}

}

const mapStateToProps = (state) => {
 	return {
		productData: state.productReducer.data,
		BusinessId: state.commonReducer.BusinessId
	 }
}

export default connect(mapStateToProps)(Product)
