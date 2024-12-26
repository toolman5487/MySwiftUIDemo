import SwiftUI

struct CalculatorView: View {
    @State private var display = "0"
    @State private var currentOperation: String = "" // 當前的運算符
    @State private var firstOperand: Double? = nil // 第一個運算數
    @State private var secondOperand: Double? = nil // 第二個運算數
    
    var body: some View {
        VStack {
            textBar
            numberButton
        }
        .background(Color.gray.opacity(0.2))
    }
}

extension CalculatorView {
    var textBar: some View {
        Text(display)
            .font(.system(size: displayFontSize(for: display))) // 調整字體大小
            .fontWeight(.light)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, minHeight: 240, alignment: .bottomTrailing)
            .padding(.horizontal)
    }
    
    var numberButton: some View {
        GeometryReader { geometry in
            let totalPadding: CGFloat = 20
            let buttonSize = (geometry.size.width - totalPadding * 2 - 30) / 4
            let vstackSpace = (geometry.size.height - buttonSize * 4 ) / 4
            
            VStack(spacing: vstackSpace) {
                HStack(spacing: 10) {
                    button("7", size: buttonSize, action: { handleNumber("7") })
                    button("8", size: buttonSize, action: { handleNumber("8") })
                    button("9", size: buttonSize, action: { handleNumber("9") })
                    button("*", size: buttonSize, action: { handleOperator("*") })
                }
                HStack(spacing: 10) {
                    button("4", size: buttonSize, action: { handleNumber("4") })
                    button("5", size: buttonSize, action: { handleNumber("5") })
                    button("6", size: buttonSize, action: { handleNumber("6") })
                    button("-", size: buttonSize, action: { handleOperator("-") })
                }
                HStack(spacing: 10) {
                    button("1", size: buttonSize, action: { handleNumber("1") })
                    button("2", size: buttonSize, action: { handleNumber("2") })
                    button("3", size: buttonSize, action: { handleNumber("3") })
                    button("+", size: buttonSize, action: { handleOperator("+") })
                }
                HStack(spacing: 10) {
                    button(".", size: buttonSize, action: { handleDecimalPoint() })
                    button("0", size: buttonSize, action: { handleNumber("0") })
                    button("=", size: buttonSize, action: { handleEqual() })
                    button("AC", size: buttonSize, action: { handleClear() })
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
    
    func button(_ title: String, size: CGFloat, action: @escaping () -> Void) -> some View {
        Text(title)
            .font(.title)
            .frame(width: size, height: size)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(size / 2)
            .onTapGesture {
                action()
            }
    }
    
    func handleNumber(_ number: String) {
        if display == "0" {
            display = number
        } else {
            display += number
        }
    }
    
    func handleDecimalPoint() {
        if !display.contains(".") {
            display += "."
        }
    }
    
    func handleOperator(_ operation: String) {
        if let currentNumber = Double(display) {
            firstOperand = currentNumber
            currentOperation = operation
            display = "0"
        }
    }
    
    func handleEqual() {
        if let firstOperand = firstOperand,
           let currentNumber = Double(display),
           currentOperation != "" {
            secondOperand = currentNumber
            let result: Double
            switch currentOperation {
            case "+":
                result = firstOperand + currentNumber
            case "-":
                result = firstOperand - currentNumber
            case "*":
                result = firstOperand * currentNumber
            case "/":
                result = currentNumber == 0 ? 0 : firstOperand / currentNumber
            default:
                return
            }
            display = String(format: "%.2f", result)
            self.firstOperand = nil
            self.currentOperation = ""
        }
    }
    
    func handleClear() {
        display = "0"
        firstOperand = nil
        secondOperand = nil
        currentOperation = ""
    }
}

#Preview {
    CalculatorView()
}
