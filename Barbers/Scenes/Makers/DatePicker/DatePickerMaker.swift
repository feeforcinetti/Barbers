//
//  DatePickerMaker.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 17/01/24.
//

import UIKit

public extension UIDatePicker {
    static func datePicker(
        datePickerMode: UIDatePicker.Mode = .dateAndTime,
        minimumDate: Date? = nil,
        maximumDate: Date? = nil,
        datePickerStyle: UIDatePickerStyle = .inline,
        userInterfaceStyle: UIUserInterfaceStyle = .dark
    ) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = datePickerMode
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        datePicker.preferredDatePickerStyle = datePickerStyle
        datePicker.overrideUserInterfaceStyle = userInterfaceStyle
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }
}
