//
// Created by TMA on 02/20/25.
//
import SwiftUI

struct EditUserDetailsScreen: View {
    // MARK: - Properties

    @State private var name: String = ""
    @State private var email: String = ""
    @State private var selectedGender: Gender = .male
    @State private var dateOfBirth = Date()
    @State private var showingDatePicker = false
    @State private var selectedCountry: String = ""
    private var startDate = Calendar.current.date(byAdding: .year, value: -100, to: Date()) ?? Date()
    @Environment(\.dismiss) var dismiss
    @State private var showConfirmation: Bool = false
    @State private var isConfirmationGiven: Bool = false

    // MARK: - Body

    var body: some View {
        ZStack {
            VStack {
                Header(text: AppStrings.UpdateUserDetails, hasBackButton: true, onBackArrowClick: {
                    AnalyticsManager.logButtonClickEvent(buttonType: .back, label: "")
                    dismiss()
                })

                CustomTitleTextFieldView(label: AppStrings.Name, placeholder: AppStrings.NamePlaceHolder, inputText: $name)
                    .padding(.vertical, 20)

                CustomTitleTextFieldView(label: AppStrings.Email, placeholder: AppStrings.EmailPlaceHolder, inputText: $email)

                GenderView(selectedGender: $selectedGender)
                    .padding(.vertical, 20)

                CustomTitleTextFieldView(label: AppStrings.DateOfBirth, placeholder: AppStrings.DateOfBirthPlaceHolder, inputText: Binding.constant(formatDate(dateOfBirth)))
                    .onTapGesture {
                        self.showingDatePicker = true
                    }
                    .popover(isPresented: $showingDatePicker, attachmentAnchor: .point(.bottom), arrowEdge: .bottom) {
                        DatePickerPopover(isPresented: $showingDatePicker, dateSelection: $dateOfBirth, title: AppStrings.DateOfBirthPlaceHolder, doneButtonLabel: AppStrings.Done)
                    }

                CountryView(selectedCountry: $selectedCountry)
                    .padding(.vertical, 20)

                CustomTitleTextFieldView(label: AppStrings.SelectLanguage, placeholder: AppStrings.SelectLanguagePlaceHolder, inputText: Binding.constant(userLanguage))
                    .onTapGesture {
                        openDeviceSettings()
                    }

                Spacer()

                TextButton(onClick: {
                    if hasEnteredAllDetails() {
                        AnalyticsManager.logButtonClickEvent(buttonType: .primary, label: "Update")
                        let userProperties = ["name": name, "email": email, "gender": selectedGender, "country": selectedCountry, "language": userLanguage] as [String: Any]
                        AnalyticsManager.logCustomEvent(eventType: .updateUser, properties: userProperties)
                        showConfirmation = true
                    }
                }, text: AppStrings.Update)
            }
            .padding(20)

            Spacer()

            bottomSheet
        }
        .onChange(of: isConfirmationGiven) { _, isConfirmationGiven in
            if isConfirmationGiven {
                saveUserDetails(name: name, email: email, dob: dateOfBirth, gender: selectedGender, country: selectedCountry, language: userLanguage)
                dismiss()
            }
        }
        .onAppear {
            initializeDetails()
            AnalyticsManager.logScreenView(screenName: String(describing: Self.self))
        }
    }

    private var bottomSheet: some View {
        CustomBottomSheetView(isOpen: $showConfirmation, maxHeight: 250, content: {
            ConfirmationSheet(isConfirmationGiven: $isConfirmationGiven, isOpen: $showConfirmation, title: AppStrings.SaveUserInfoBottomSheetTitle, subTitle: AppStrings.SaveUserInfoBottomSheetSubTitle)
        })
    }

    private func hasEnteredAllDetails() -> Bool {
        return !name.isEmpty && !selectedGender.rawValue.isEmpty && !dateOfBirth.description.isEmpty && !selectedCountry.isEmpty
    }

    private func initializeDetails() {
        let user = UserPreferences.shared.getUser()
        name = user?.name ?? ""
        email = user?.email ?? ""
        selectedGender = Gender(rawValue: user?.gender ?? Gender.male.rawValue) ?? Gender.male
        let dob = user?.dob ?? formatDate(Date())
        dateOfBirth = dob.formattedDate(format: "dd-MM-yyyy") ?? Date()
        selectedCountry = user?.country ?? ""
    }
}

#Preview {
    EditUserDetailsScreen()
}
