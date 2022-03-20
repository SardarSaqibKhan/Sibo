//
//  StatietiesVC.swift
//  Sibo
//
//  Created by Abdul on 03/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import UIKit
import Charts

class StatietiesVC: UIViewController {

    @IBOutlet weak var chart: HorizontalBarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
//
//     chart.setVisibleXRange(minXRange: 0, maxXRange: 10)
      // chart.xAxis.addLimitLine(ChartLimitLine(limit: 60, label: "reports"))
        setupChart()
        setChart()
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupChart() {
        //chart.backgroundColor = #colorLiteral(red: 0.4882202692, green: 0.6892570873, blue: 1, alpha: 1)
        chart.gridBackgroundColor = #colorLiteral(red: 0.3211786935, green: 0.4534319953, blue: 0.6578561231, alpha: 1)
        chart.drawGridBackgroundEnabled = true
        self.chart.fitBars                   = true
        self.chart.legend.enabled            = true
        self.chart.isUserInteractionEnabled  = false
        self.chart.animate(yAxisDuration: 1.5)
        self.chart.drawValueAboveBarEnabled = false
        self.chart.rightAxis.enabled = true
        self.chart.rightAxis.axisLineColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
       // self.chart.xAxis.l
        
        
      //  self.chart.xAxis.labelPosition = .bottom
      
        
        self.chart.rightAxis.labelCount      = 5
        self.chart.rightAxis.labelFont       = UIFont.boldSystemFont(ofSize: 10.0)
        self.chart.rightAxis.labelTextColor = UIColor.white
      //  self.chart.leftAxis.valueFormatter  = CustomAxisValueFormatter()
        
        self.chart.xAxis.drawGridLinesEnabled    = false
        self.chart.xAxis.enabled                 = true
        self.chart.xAxis.labelTextColor = #colorLiteral(red: 0.3893601298, green: 0.5439696312, blue: 0.7794428468, alpha: 1)
        self.chart.xAxis.axisLineColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        chart.leftAxis.enabled = true
    }
    
    func setChart() {
        
        let unitsSold = ["5", "10", "15", "20"]
        
        let test = [1, 2, 3, 4, 5, 6, 7]
        
        let months = ["Aug 2019","Sept 2019","Oct 2019","Nov 2019"]
        
        
        let number = [10,20,30,40,50,60]
       
        let xaxis:XAxis = XAxis()
        
      
        
        var dataEntries: [BarChartDataEntry] = []
        
        
        for i in 0..<3{
            
            let dataEntry = BarChartDataEntry(x: Double(test[i]), y: Double(unitsSold[i]) as! Double)
          
            dataEntries.append(dataEntry)
        }
        
        
        
    
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Reports")

       chartDataSet.setColor(#colorLiteral(red: 0.7686999694, green: 0.8474195853, blue: 0.934939357, alpha: 1).withAlphaComponent(0.4))
        chartDataSet.barBorderColor = .white
        chartDataSet.barBorderWidth = 1
        
        
       
      
//        chartDataSet.xA.valu = IndexAxisValueFormatter(values: unitsSold) as! IValueFormatter
    
        
        
        let chartData = BarChartData(dataSet: chartDataSet)
     
//        var format = DefaultValueFormatter(decimals: 20)
//        chartData.setValueFormatter(format)
        
        chartData.setDrawValues(true)
        
        chart.data = chartData
       chartData.setValueTextColor(UIColor.white)
         chart.xAxis.labelCount = unitsSold.count
        chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        
        chart.xAxis.labelFont = UIFont.systemFont(ofSize: 15)
        
         //chart.xAxis.granularityEnabled = true
//         chart.xAxis.labelPosition = .bottomInside
//        chart.xAxis.labelTextColor = .white
    
        
        chart.drawValueAboveBarEnabled = true
       // chart.bar
       
      //  chart.xAxis.labelPosition = .top
       // chart.leftAxis.labelPosition = .insideChart
         //chart.xAxis.granularity = 4
       // chart.xAxis.centerAxisLabelsEnabled = true
        
        
//        chart.xAxis.valueFormatter = DefaultAxisValueFormatter { (value, axis) -> String in
//            return String(unitsSold[Int(value)])
//        }
    
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
