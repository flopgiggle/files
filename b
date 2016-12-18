import React, { PropTypes } from 'react';
import { connect } from 'react-redux';
import { getBusinessInfo } from '../../actions/business'
import { Row, Col, Icon } from 'antd';
import './style.css';

class Business extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tableData: this.getTableData(),
      groupStatusInfo: new Map()
    };
    //显示阶梯列的索引
    //只有索引有值时才显示,没有处于索引中的阶梯自动隐藏
    this.showStairsAreaIndex = [];
  }

  //组件完成加载业务数据
  // componentDidMount() {
  // 	this.props.dispatch(getBusinessInfo());
  // }

  componentWillReceiveProps(nextProps) {
    if (this.props.BusinessId !== nextProps.BusinessId) {
      this.props.dispatch(getBusinessInfo());
    }
  }

  shouldComponentUpdate(nextProps, nextSate) {
    return this.props.BusinessId === nextProps.BusinessId;
  }

  getTableData() {
    return this.getTestData1();
  }

  getTestData1() {
    const titleNames = ["代表处/业务部二级基线22", "代表处/业务部级基线2", "地区部级基线3", "地区部级基线3"];

    const detailDataOne = {
      name: "小计",
      value: 1200,
      percent: 23.4,
      stairsDatas: [1700, 1500, 1300, 180]
    }

    const detailData2 = {
      name: "PC110",
      value: 870.33,
      percent: 23.4,
      stairsDatas: [900, 800, 700, 600]
    }

    const totalData = {
      name: "总计",
      value: 750,
      percent: 23.4,
      stairsDatas: [800, 700, 600, 500]
    }

    const groupOne = {
      name: "产品",
      value: 720.33,
      percent: 23.4,
      approveLeave: "代表处/业务部二级",
      items: [
        detailData2, detailDataOne
      ],
      stairsDatas: [400, 300, 200, 100]
    }

    const groupTwo = {
      name: "服务",
      value: 960.33,
      percent: 53.4,
      approveLeave: "代表处/业务部二级",
      items: [
        detailDataOne,
        detailData2,
        detailDataOne,
        detailData2,
        detailDataOne,
        detailData2
      ],
      stairsDatas: [800, 700, 600, 500]
    }

    const group3 = {
      name: "其他",
      value: 550.33,
      percent: 53.4,
      approveLeave: "代表处/业务部二级",
      items: [
        detailDataOne,
        detailData2,
        detailDataOne,
        detailData2,
        detailDataOne,
        detailData2
      ],
      stairsDatas: [800, 700, 600, 500]
    }

    const tableData = {
      titleNames: titleNames,
      taotal: totalData,
      groups: [groupOne, groupTwo, group3]
    }

    return tableData;
  }

  getTestData2() {
    const titleNames = ["代表处/业务部二级基线22", "代表处/业务部级基线2", "地区部级基线3"];

    const detailDataOne = {
      name: "小计",
      value: 1400,
      percent: 23.4,
      stairsDatas: [1700, 1500, 1300]
    }

    const detailData2 = {
      name: "PC110",
      value: 960.33,
      percent: 23.4,
      stairsDatas: [900, 800, 700]
    }

    const totalData = {
      name: "总计",
      value: 750,
      percent: 23.4,
      stairsDatas: [800, 700, 600]
    }

    const groupOne = {
      name: "产品",
      value: 720.33,
      percent: 23.4,
      approveLeave: "代表处/业务部二级",
      items: [
        detailData2, detailDataOne
      ],
      stairsDatas: [400, 300, 200]
    }

    const groupTwo = {
      name: "服务",
      value: 960.33,
      percent: 53.4,
      approveLeave: "代表处/业务部二级",
      items: [
        detailDataOne,
        detailData2,
        detailDataOne,
        detailData2,
        detailDataOne,
        detailData2
      ],
      stairsDatas: [800, 700, 600]
    }

    const group3 = {
      name: "其他",
      value: 650.33,
      percent: 53.4,
      approveLeave: "代表处/业务部二级",
      items: [
        detailDataOne,
        detailData2,
        detailDataOne,
        detailData2,
        detailDataOne,
        detailData2
      ],
      stairsDatas: [800, 700, 600]
    }

    const tableData = {
      titleNames: titleNames,
      taotal: totalData,
      groups: [groupOne, groupTwo, group3]
    }

    return tableData;
  }

  getTestData3() {
    const titleNames = ["代表处/业务部二级基线22"];

    const detailDataOne = {
      name: "小计",
      value: 1800,
      percent: 23.4,
      stairsDatas: [1700]
    }

    const detailData2 = {
      name: "PC110",
      value: 960.33,
      percent: 23.4,
      stairsDatas: [900]
    }

    const totalData = {
      name: "总计",
      value: 950,
      percent: 23.4,
      stairsDatas: [800]
    }

    const groupOne = {
      name: "产品",
      value: 720.33,
      percent: 23.4,
      approveLeave: "代表处/业务部二级",
      items: [
        detailData2, detailDataOne
      ],
      stairsDatas: [400]
    }

    const tableData = {
      titleNames: titleNames,
      taotal: totalData,
      groups: [groupOne]
    }

    return tableData;
  }

  //保留两位小数
  getRound(num, len) {
    return Math.round(num * Math.pow(10, len)) / Math.pow(10, len);
  }

  getShowOrHideIconType(isShowDetail) {
    return isShowDetail ? "minus-circle" : "plus-circle";
  }

  //处理显示或隐藏分组明细事件
  showOrHideGroupDetails(groupData, e) {
    //点击了加号
    if (e.target.className.indexOf("plus-circle") > 0) {
      this
        .state
        .groupStatusInfo
        .set(groupData, { isShowDetail: true })
    } else {
      this
        .state
        .groupStatusInfo
        .set(groupData, { isShowDetail: false })
    }
    this.setState({ groupStatusInfo: this.state.groupStatusInfo });
  }

  //生成表格的阶梯部分区域
  generateTableHeaderStageInfoArea(titleNames) {
    const tds = [];
    titleNames.forEach((item, i) => {
      tds.push(
        <th width='8%' className={"stairsColumn"+i}></th>
      );
      tds.push(
        <th
          width='8%'
          className={"stageCell stairsColumn"+i}
          style={{
            minWidth: "90px"
          }}>{titleNames[i]}</th>
      );
    });
    return tds;
  }

  // 生成表格合计行区域 根据阶梯列数动态生成 每个阶梯生成两列,分别为阶梯数值区域和阶梯区间区域 value会根据一定算法,自动选择落到某个阶梯区间
  // stairsCount table的阶梯列数 stairsData 每个阶梯对应的数据,为数组 count 实际展示的业务数据
  generateCountRowInfoArea(stairsValue, stairsDatas, count) {
    const tds = [];

    //数据展示到哪个区间
    let showInWhichStairs;

    //左侧区间值
    let leftStairsValue;

    //右侧区间值
    let rightStairsValue;

    //计算实际业务数据应该展示到哪一个区间
    for (let i = 0; i < stairsDatas.length; i++) {
      //每次循环，重置显示区域,-1为未匹配到显示区域
      showInWhichStairs = -1;

      //数据如果大于最大区间值,则显示到第一个区间
      if (i == 0 && stairsValue >= stairsDatas[i]) {
        showInWhichStairs = i;
        rightStairsValue = stairsDatas[i];
        break;
      }

      //数据匹配到中间区间
      if ((i > 0 && i < (stairsDatas.length - 1)) && (stairsValue >= stairsDatas[i] && stairsValue < stairsDatas[i - 1])) {
        showInWhichStairs = i;
        leftStairsValue = stairsDatas[i];
        rightStairsValue = stairsDatas[i + 1];
        break;
      }

      //数据小于最小区间值，则显示到最后一个区间
      if (i == (stairsDatas.length - 1) && stairsValue >= stairsDatas[i]) {
        showInWhichStairs = i;
        leftStairsValue = stairsDatas[i];
        rightStairsValue = stairsDatas[i - 1];
        break;
      }
    }

    //阶梯列不为1时表示该阶梯要展示
    if(showInWhichStairs != -1){
      this.showStairsAreaIndex.push(showInWhichStairs);
    }

    //阶梯图内容
    for (let i = 0; i < stairsDatas.length; i++) {
      let stairsInfoContent;
      if (i == showInWhichStairs) {
        stairsInfoContent = this.generateStairsContent(stairsValue, leftStairsValue, rightStairsValue);
      }

      const widthPercent = 80 / stairsDatas.length;
      const infoContentPerent = widthPercent * 0.8 + "%";
      const stairsDatasPerent = widthPercent * 0.2 + "%";

      tds.push(
        <td width={infoContentPerent} className = {"stairsColumn"+i}>
          <div className={"tdstairs"}>{stairsInfoContent}</div>
        </td>
      );
      tds.push(
        <td className={"stageCell stairsColumn"+i} width={stairsDatasPerent}>{stairsDatas[i]}</td>
      );
    }
    return tds;
  }

  // 生成阶梯的具体信息 currentValue 当前行的值 leftStairsValue 左侧区间值上限 rightStairsValue 右侧区间值上限
  generateStairsContent(currentValue, leftStairsValue, rightStairsValue) {
    let bottomLeftInfo;
    let bottomRightInfo;

    if (leftStairsValue) {
      const value = this.getRound((currentValue - leftStairsValue), 2);
      const persent = this.getRound((value / currentValue) * 100, 2);
      bottomLeftInfo = "$" + value + "(" + persent + "%)";
    }

    if (rightStairsValue) {
      const value = this.getRound((currentValue - rightStairsValue), 2);
      const persent = this.getRound((value / currentValue) * 100, 2);
      bottomRightInfo = "$" + value + "(" + persent + "%)";
    }

    return <div className="stairsContent">
      <div className='tdTop'>
        <span>{currentValue}</span>
      </div>
      <div className='tdBottom'>
        <div className='tdBottomLeft'>
          <span>{bottomLeftInfo}</span>
        </div>
        <div className='tdBottomRight'>
          <span>{bottomRightInfo}</span>
        </div>
      </div>
    </div>;
  }

  //生成分组名称信息区域(分组的起始单元格)
  generateGroupNameInfoArea(isShowAddIcon, groupDetaisData) {
    return <div className='tdtitle'>
      <span className="titleText">{groupDetaisData.name}</span>
      <span className="link">${groupDetaisData.value}</span>
      <span className="link">({groupDetaisData.percent})</span>
      <Icon
        onClick={this.showOrHideGroupDetails.bind(this, groupDetaisData)}
        className='showOrHideButton'
        type={this.getShowOrHideIconType(isShowAddIcon)} />
      <br />
      <span>
        <span className="titleText">审批级别:</span>{groupDetaisData.approveLeave}</span>
    </div>
  }

  //仅仅显示分组信息区域，此时分组行列都处于折叠状态
  onlyShowGroupArea(groupDetaisData) {
    return <tr>
      <td colSpan={2}>
        {this.generateGroupNameInfoArea(false, groupDetaisData)}
      </td>
      {this.generateCountRowInfoArea(groupDetaisData.value, groupDetaisData.stairsDatas, 32)}
    </tr>
  }

  //显示分组和明细信息，行列全为展开状态
  showDetailArea(groupDetaisData) {
    const rows = [];
    for (let i = 0; i < groupDetaisData.items.length; i++) {
      let productNameTd;

      //只在第一行行首增加产品名称，并且需要合并首列以突出分组
      if (i == 0) {
        productNameTd = <td rowSpan={groupDetaisData.items.length}>
          {this.generateGroupNameInfoArea(true, groupDetaisData)}
        </td>
      }
      rows.push(
        <tr>
          {productNameTd}
          <td>
            <div style={{ minWidth: "60px" }}>{groupDetaisData.items[i].name}</div>
          </td>
          {this.generateCountRowInfoArea(groupDetaisData.items[i].value, groupDetaisData.items[i].stairsDatas, 32)}
        </tr>
      );
    };
    return rows;
  }

  //生成分组明细区域，初次加载只显示产品大类 例如:产品下的明细
  generateGroupDetailsArea(groupDetaisData) {
    let rows = [];

    //产品合并列数,在不显示明细时需要合并列
    const isShowDetail = false;

    //检查状态,是否需要显示产品明细
    let groupStatusInfo = this.state.groupStatusInfo.get(groupDetaisData);
    if (groupStatusInfo && groupStatusInfo.isShowDetail) {
      rows = rows.concat(this.showDetailArea(groupDetaisData));
    } else {
      rows.push(this.onlyShowGroupArea(groupDetaisData));
    }
    return rows;
  }

  //生成分组数据区域 例如:产品、服务的每一个大类
  generateGroupInfoArea(groupsData) {
    let rows = [];
    groupsData.forEach(oneGroup => {
      rows = rows.concat(this.generateGroupDetailsArea(oneGroup));
    });
    return rows;
  }
  


  getStandardData(businessData){
    
    const tableData = {
      titleNames: [],
      taotal: totalData,
      groups: []
    }
     const groupMap = new Map();

     let isNONNASmallSingleAmount = 0;
     let officeBaseLine2Amount = 0;
     let officeBaseLineAmount = 0;
     let regionBaseLineAmount = 0;
     let channelBaseLineAmount = 0;
     let sPQBaseLineAmount = 0;
     let totalAmount = 0;
     //按产品大类,对业务数据进行分组,并汇总合计行的各底线数据
     for(const item of businessData){
        if(groupMap.has(item.DataFlag)){
          const groupsData = groupMap.get(item.DataFlag);
          groupsData.push(item);
        }else{
          const groupsData = [];
          groupsData.push(item);
          groupMap.set(item.DataFlag,groupsData);
        }
        isNONNASmallSingleAmount += parseFloat(item.IsNONNASmallSingle);
        officeBaseLine2Amount += parseFloat(item.OfficeBaseLine2);
        officeBaseLineAmount += parseFloat(item.OfficeBaseLine);
        regionBaseLineAmount += parseFloat(item.RegionBaseLine);
        channelBaseLineAmount += parseFloat(item.ChannelBaseLine);
        sPQBaseLineAmount += parseFloat(item.SPQBaseLine);
        totalAmount += parseFloat(item.TotalAmount);
    }
    
    const totalData = {
      name: "总计",
      value: totalAmount,
      percent: 100,
      stairsDatas: [isNONNASmallSingleAmount, officeBaseLine2Amount, officeBaseLineAmount,regionBaseLineAmount,channelBaseLineAmount,sPQBaseLineAmount]
    }

    //根据分组数据,生成每个分组的明细数据
    for (const [key, value] of groupMap) {
      const groupItem = {
        name: key,
        value: 0,
        percent: 0,
        approveLeave: "",
        items: [],
        stairsDatas: [400]
      }
      
      for (const datarow of value){
          if(datarow.ProductCategory == "小计"){
              groupItem.value = datarow.TotalAmount;
              groupItem.percent = datarow.AmountPCT;
              groupItem.approveLeave = datarow.ProjectApprovalLevel;
              groupItem.stairsDatas = this.getStairsDataFromDataRow(datarow);
          }
          const detailData = {
            name: datarow.ProductCategory,
            value: datarow.TotalAmount,
            percent: datarow.AmountPCT,
            stairsDatas: this.getStairsDataFromDataRow(datarow)
          }
          groupItem.items.push(detailData);
      }
      
      tableData.taotal = totalData;
      tableData.groups.push(groupItem);
      for(const item of this.getTitleNamesData()){
        tableData.titleNames.push(item.name);
      }
    }

    return tableData;
  }

  getTitleNamesData(){
    return    [ 
                {key:"IsNONNASmallSingle",name:"万以下授权底线"},
                {key:"OfficeBaseLine2",name:"代表处/业务部二级底线(去除服务器)"},
                {key:"OfficeBaseLine",name:"代表处/业务部级底线"},
                {key:"RegionBaseLine",name:"地区部级底线"},
                {key:"ChannelBaseLine",name:"渠道授权底线"},
                {key:"SPQBaseLine",name:"特价门槛底线"}
              ];
  }

  getStairsDataFromDataRow(dataRow){
    const data = [];
    for(const item of this.getTitleNamesData()){
      data.push(dataRow[item.key]);
    }
    return data;
  }

  getMoniData(){
    return [
      {"ProjectApprovalLevel":"代表处","DataFlag":"产品、服务、合计","ProductCategory":"小计","AmountPCT":17.22,"ChannelBaseLine":"2451","SPQBaseLine":"1545","IsNONNASmallSingle":"5620","OfficeBaseLine2":"2145","OfficeBaseLine":"1545","RegionBaseLine":"600","TotalAmount":"1895","ServiceAmount":"1564","UserPermission":"001000"},
      {"ProjectApprovalLevel":"业务部级","DataFlag":"产品、服务、合计","ProductCategory":"服务器、小计","AmountPCT":18.22,"ChannelBaseLine":"2451","SPQBaseLine":"1545","IsNONNASmallSingle":"5620","OfficeBaseLine2":"2145","OfficeBaseLine":"1545","RegionBaseLine":"600","TotalAmount":"1895","ServiceAmount":"1564","UserPermission":"001000"},
      {"ProjectApprovalLevel":"代表处/业务部级","DataFlag":"产品、服务、合计","ProductCategory":"服务器、小计","AmountPCT":25.22,"ChannelBaseLine":"2451","SPQBaseLine":"1545","IsNONNASmallSingle":"5620","OfficeBaseLine2":"2145","OfficeBaseLine":"1545","RegionBaseLine":"600","TotalAmount":"1895","ServiceAmount":"1564","UserPermission":"001000"}];
  }

  hideBlankStairs(){
    debugger;
    const set = new Set();
    this.showStairsAreaIndex.map(x => set.add(x))
    const stairsLength = this.state.tableData.titleNames.length;
    for(let i=0;i<stairsLength;i++){
      if(!set.has(i)){
        var elements = document.getElementsByClassName("stairsColumn"+i);
        for(const item of elements){
          item.style.display = "none"; 
          //item.style.backgroundColor = "red"
        }
      }  
    }
  }

  componentDidMount(){
    this.hideBlankStairs();  
  }

  componentDidUpdate(){
    this.hideBlankStairs();  
  }

  render() {
    let {businessData} = this.props;

    businessData = this.getMoniData();
    var standardData = this.getStandardData(businessData);

    this.showInWhichStairs = [];
    //console.log(businessData);
    const tableData = this.state.tableData;//this.getTableData();//this.state.tableData;
    let allDetailsCount = 1;
    tableData
      .groups
      .forEach(function (oneGruop) {
        allDetailsCount += oneGruop.items.length
      }, this);

    const groupAreaContent = [];;

    return (
      <div className='businessContainer'>
        <table className='commercialTable'>
          <thead>
            <tr>
              <th colSpan='3' width='10%' style={{ maxWidth: "300px" }}></th>
              {this.generateTableHeaderStageInfoArea(tableData.titleNames)}
            </tr>
          </thead>
          <tbody>
            <tr>
              <td rowSpan={allDetailsCount} style={{ minWidth: "35px" }}>
                <div className="titleText center">
                  <span style={{ display: "flex" }}>项目</span>
                </div>
              </td>
              <td colSpan='2' className="titleText">总计</td>
              {this.generateCountRowInfoArea(tableData.taotal.value, tableData.taotal.stairsDatas, 33)}
            </tr>
            {this.generateGroupInfoArea(tableData.groups)}
          </tbody>
        </table>
      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    businessData: state.businessReducer.data,
    BusinessId: state.commonReducer.BusinessId
  }
}

export default connect(mapStateToProps)(Business)
