import ApplicationController from "./application_controller";

export default class extends ApplicationController {
  static targets = ["title", "body"];

  next(event) {
    event.preventDefault();
    this.stimulate("WizardReflex#next", this.postValues());
  }

  previous(event) {
    event.preventDefault();
    this.stimulate("WizardReflex#previous", this.postValues());
  }

  postValues() {
    return {
      title: this.hasTitleTarget && this.titleTarget.value,
      body: this.hasBodyTarget && this.bodyTarget.value
    };
  }
}
