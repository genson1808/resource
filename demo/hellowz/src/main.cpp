
#include "MathLib.hpp" // Ensure this file exists in your project or is accessible.
#include <wx/wx.h>

class MyApp : public wxApp {
public:
  virtual bool OnInit();
};

class MyFrame : public wxFrame {
public:
  MyFrame();

private:
  void OnAdd(wxCommandEvent &event);
  void OnSubtract(wxCommandEvent &event);

  wxTextCtrl *inputA;
  wxTextCtrl *inputB;
  wxStaticText *resultText;
};

wxIMPLEMENT_APP(MyApp);

bool MyApp::OnInit() {
  MyFrame *frame = new MyFrame();
  frame->Show(true);
  return true;
}

MyFrame::MyFrame() : wxFrame(nullptr, wxID_ANY, "Math Operations") {
  wxPanel *panel = new wxPanel(this, wxID_ANY);
  wxBoxSizer *sizer = new wxBoxSizer(wxVERTICAL);

  inputA = new wxTextCtrl(panel, wxID_ANY);
  inputB = new wxTextCtrl(panel, wxID_ANY);
  wxButton *addButton = new wxButton(panel, wxID_ANY, "Add");
  wxButton *subtractButton = new wxButton(panel, wxID_ANY, "Subtract");
  resultText = new wxStaticText(panel, wxID_ANY, "Result: ");

  sizer->Add(inputA, 0, wxALL | wxEXPAND, 5);
  sizer->Add(inputB, 0, wxALL | wxEXPAND, 5);
  sizer->Add(addButton, 0, wxALL, 5);
  sizer->Add(subtractButton, 0, wxALL, 5);
  sizer->Add(resultText, 0, wxALL, 5);

  panel->SetSizer(sizer);

  addButton->Bind(wxEVT_BUTTON, &MyFrame::OnAdd, this);
  subtractButton->Bind(wxEVT_BUTTON, &MyFrame::OnSubtract, this);
}

void MyFrame::OnAdd(wxCommandEvent &event) {
  int a = wxAtoi(inputA->GetValue());
  int b = wxAtoi(inputB->GetValue());
  int result = MathLib::add(a, b);
  resultText->SetLabel(wxString::Format("Result: %d", result));
}

void MyFrame::OnSubtract(wxCommandEvent &event) {
  int a = wxAtoi(inputA->GetValue());
  int b = wxAtoi(inputB->GetValue());
  int result = MathLib::subtract(a, b);
  resultText->SetLabel(wxString::Format("Result: %d", result));
}
