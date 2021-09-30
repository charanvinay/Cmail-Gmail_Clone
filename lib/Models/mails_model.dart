class MailsModel {
  String senderName, subject, desc, time;
  bool isStarred;

  MailsModel({
    required this.senderName,
    required this.subject,
    required this.desc,
    required this.time,
    this.isStarred = false,
  });
}

List<MailsModel> mails = [
  MailsModel(
    senderName: "Kiran siva sai",
    time: "13:03",
    subject:
        "Here is your chance to bag interview offers from L'Oréal with it's Sustainability Hiring Challenge 2021 | Only 2 days left!",
    desc:
        "Launching its fifth edition, L'Oréal is back with the Sustainability Challenge 2021. It is an all-Digital Challenge that resonates with L’Oréal’s sustainability program. This year, we are partnering with the world’s leading mass-market natural beauty brand – Garnier.\n\nApart from experience, the winners have a lot in store for them including pre-placement interviews (PPIs) with L'Oréal India and lots of exciting gift hampers!",
  ),
  MailsModel(
    senderName: "TCS NQT",
    isStarred: true,
    time: "12:14",
    subject:
        "TCS NQT View your Exam Schedule and Login Details for Actual/Final Exam - Reminder",
    desc:
        "Dear CHARAN VINAY NARNI,\n\nA DETAILED EMAIL for you to, read through and comprehensively understand how to participate in the TCS NQT Online Remote Proctored Assessment and to view your Exam schedule Date and Time.\n\n\nView your Exam Schedule: https://learning.tcsionhub.in/hub/hallticketlogin/eventlogin/\n\n\n(Above link is only for candidates who are taking the Exam in Online Mode) Login with below credentials and click on Exam Schedule tab to check your Exam Date and Time.\n\n\nLink to launch the actual exam: https://learning.tcsionhub.in/hub/augnqtevent/eventlogin/\n\n(Events scheduled for you will appear in the above link only on the Day of Exam or One Day prior to the Exam. Be prepared for your exam as per the schedule in the Exam Schedule link)\n\nUsername : DT20215455468464\n\nPassword: 8317566250\n\nRegistration Time : 8:00 AM\n\nExam Timing: 9:00 AM to 12:00 PM\n\nSubject : NQT and Programming",
  ),
  MailsModel(
    senderName: "Hashwanth",
    time: "11:49",
    subject: "Cuvette Tech - Our new website is LIVE now.",
    desc:
        "Hi,We have just launched our new website and would like you to check it out. You can now directly login on website -> Create your profile -> And start applying for the internships.\n\nOnce you enter the dashboard, there is a suggestion/ help section on top from where you can give us your valuable feedback. If you face any issue while using the dashboard or have any suggestions for us, do drop your message there. \n\nThere are lots of exciting opportunities coming on our platform everyday now. You can invite your friends as well to help each other in getting right opportunities in this pandemic time. ",
  ),
  MailsModel(
    senderName: "Yashwanth sai",
    time: "10:12",
    subject: "Hey Charan, you are invited to Expert Meet'21 😇",
    desc:
        "The joining link will be shared 2 hours prior to the Expert Meet begins.\n\nThis year, you stand a chance to win an all-new Echo Show 5.\n\nTo know more about the event and register, click on the button below.",
  ),
  MailsModel(
    senderName: "Arvindh Ippili",
    isStarred: true,
    time: "10:05",
    subject: "GitHub's The ReadME Project v9.21",
    desc:
        "The ReadME Project is a GitHub platform dedicated to highlighting the best from the open source software community—the people and tech behind projects you use every day. Each month this newsletter will highlight new stories, best practices, and opinions developed for The ReadME Project, as well as sharing great listens and reads from across the community.",
  ),
  MailsModel(
    senderName: "Chegg India",
    isStarred: true,
    time: "09:37",
    subject: "Payment Initiated to your account",
    desc:
        "MNIDESDFSDFQAAUG2021 Warm Regards Axis Bank This is a system generated mail. Please do not reply to this email.",
  ),
  MailsModel(
    senderName: "Manohar Kademasetti",
    time: "09:05",
    subject:
        "Announcing Log Drains: Manage traffic and serverless logs in Datadog",
    desc:
        "Hi Charan, \n\nWe’re excited to announce that you can now search, set alerts, and analyze your Netlify traffic and serverless functions logs alongside your other logs when using Datadog Log Management. The integration is made possible with new Netlify Log Drains, which will extend to other log management and cloud storage solutions soon.\n\n\n\n\nLog Drains are now available with Netlify’s Enterprise plan. Head over to our blog to learn more. Or contact sales to ask about upgrading to take advantage of this new feature.\n\n\n\nHappy Building!",
  ),
  MailsModel(
    senderName: "Kiran siva sai",
    time: "13:03",
    subject:
        "Here is your chance to bag interview offers from L'Oréal with it's Sustainability Hiring Challenge 2021 | Only 2 days left!",
    desc:
        "Launching its fifth edition, L'Oréal is back with the Sustainability Challenge 2021. It is an all-Digital Challenge that resonates with L’Oréal’s sustainability program. This year, we are partnering with the world’s leading mass-market natural beauty brand – Garnier.\n\nApart from experience, the winners have a lot in store for them including pre-placement interviews (PPIs) with L'Oréal India and lots of exciting gift hampers!",
  ),
  MailsModel(
    senderName: "TCS NQT",
    time: "12:14",
    subject:
        "TCS NQT View your Exam Schedule and Login Details for Actual/Final Exam - Reminder",
    desc:
        "Dear CHARAN VINAY NARNI,\n\nA DETAILED EMAIL for you to, read through and comprehensively understand how to participate in the TCS NQT Online Remote Proctored Assessment and to view your Exam schedule Date and Time.\n\n\nView your Exam Schedule: https://learning.tcsionhub.in/hub/hallticketlogin/eventlogin/\n\n\n(Above link is only for candidates who are taking the Exam in Online Mode) Login with below credentials and click on Exam Schedule tab to check your Exam Date and Time.\n\n\nLink to launch the actual exam: https://learning.tcsionhub.in/hub/augnqtevent/eventlogin/\n\n(Events scheduled for you will appear in the above link only on the Day of Exam or One Day prior to the Exam. Be prepared for your exam as per the schedule in the Exam Schedule link)\n\nUsername : DT20215455468464\n\nPassword: 8317566250\n\nRegistration Time : 8:00 AM\n\nExam Timing: 9:00 AM to 12:00 PM\n\nSubject : NQT and Programming",
  ),
  MailsModel(
    senderName: "Hashwanth",
    time: "11:49",
    isStarred: true,
    subject: "Cuvette Tech - Our new website is LIVE now.",
    desc:
        "Hi,We have just launched our new website and would like you to check it out. You can now directly login on website -> Create your profile -> And start applying for the internships.\n\nOnce you enter the dashboard, there is a suggestion/ help section on top from where you can give us your valuable feedback. If you face any issue while using the dashboard or have any suggestions for us, do drop your message there. \n\nThere are lots of exciting opportunities coming on our platform everyday now. You can invite your friends as well to help each other in getting right opportunities in this pandemic time. ",
  ),
  MailsModel(
    senderName: "Yashwanth sai",
    time: "10:12",
    subject: "Hey Charan, you are invited to Expert Meet'21 😇",
    desc:
        "The joining link will be shared 2 hours prior to the Expert Meet begins.\n\nThis year, you stand a chance to win an all-new Echo Show 5.\n\nTo know more about the event and register, click on the button below.",
  ),
  MailsModel(
    senderName: "Arvindh Ippili",
    time: "10:05",
    subject: "GitHub's The ReadME Project v9.21",
    desc:
        "The ReadME Project is a GitHub platform dedicated to highlighting the best from the open source software community—the people and tech behind projects you use every day. Each month this newsletter will highlight new stories, best practices, and opinions developed for The ReadME Project, as well as sharing great listens and reads from across the community.",
  ),
  MailsModel(
    senderName: "Chegg India",
    time: "09:37",
    subject: "Payment Initiated to your account",
    desc:
        "MNIDESDFSDFQAAUG2021 Warm Regards Axis Bank This is a system generated mail. Please do not reply to this email.",
  ),
  MailsModel(
    senderName: "Manohar Kademasetti",
    time: "09:05",
    subject:
        "Announcing Log Drains: Manage traffic and serverless logs in Datadog",
    desc:
        "Hi Charan, \n\nWe’re excited to announce that you can now search, set alerts, and analyze your Netlify traffic and serverless functions logs alongside your other logs when using Datadog Log Management. The integration is made possible with new Netlify Log Drains, which will extend to other log management and cloud storage solutions soon.\n\n\n\n\nLog Drains are now available with Netlify’s Enterprise plan. Head over to our blog to learn more. Or contact sales to ask about upgrading to take advantage of this new feature.\n\n\n\nHappy Building!",
  ),
  MailsModel(
    senderName: "Kiran siva sai",
    time: "13:03",
    subject:
        "Here is your chance to bag interview offers from L'Oréal with it's Sustainability Hiring Challenge 2021 | Only 2 days left!",
    desc:
        "Launching its fifth edition, L'Oréal is back with the Sustainability Challenge 2021. It is an all-Digital Challenge that resonates with L’Oréal’s sustainability program. This year, we are partnering with the world’s leading mass-market natural beauty brand – Garnier.\n\nApart from experience, the winners have a lot in store for them including pre-placement interviews (PPIs) with L'Oréal India and lots of exciting gift hampers!",
  ),
  MailsModel(
    senderName: "TCS NQT",
    time: "12:14",
    subject:
        "TCS NQT View your Exam Schedule and Login Details for Actual/Final Exam - Reminder",
    desc:
        "Dear CHARAN VINAY NARNI,\n\nA DETAILED EMAIL for you to, read through and comprehensively understand how to participate in the TCS NQT Online Remote Proctored Assessment and to view your Exam schedule Date and Time.\n\n\nView your Exam Schedule: https://learning.tcsionhub.in/hub/hallticketlogin/eventlogin/\n\n\n(Above link is only for candidates who are taking the Exam in Online Mode) Login with below credentials and click on Exam Schedule tab to check your Exam Date and Time.\n\n\nLink to launch the actual exam: https://learning.tcsionhub.in/hub/augnqtevent/eventlogin/\n\n(Events scheduled for you will appear in the above link only on the Day of Exam or One Day prior to the Exam. Be prepared for your exam as per the schedule in the Exam Schedule link)\n\nUsername : DT20215455468464\n\nPassword: 8317566250\n\nRegistration Time : 8:00 AM\n\nExam Timing: 9:00 AM to 12:00 PM\n\nSubject : NQT and Programming",
  ),
  MailsModel(
    senderName: "Hashwanth",
    time: "11:49",
    subject: "Cuvette Tech - Our new website is LIVE now.",
    desc:
        "Hi,We have just launched our new website and would like you to check it out. You can now directly login on website -> Create your profile -> And start applying for the internships.\n\nOnce you enter the dashboard, there is a suggestion/ help section on top from where you can give us your valuable feedback. If you face any issue while using the dashboard or have any suggestions for us, do drop your message there. \n\nThere are lots of exciting opportunities coming on our platform everyday now. You can invite your friends as well to help each other in getting right opportunities in this pandemic time. ",
  ),
  MailsModel(
    senderName: "Yashwanth sai",
    time: "10:12",
    subject: "Hey Charan, you are invited to Expert Meet'21 😇",
    desc:
        "The joining link will be shared 2 hours prior to the Expert Meet begins.\n\nThis year, you stand a chance to win an all-new Echo Show 5.\n\nTo know more about the event and register, click on the button below.",
  ),
  MailsModel(
    senderName: "Arvindh Ippili",
    time: "10:05",
    subject: "GitHub's The ReadME Project v9.21",
    desc:
        "The ReadME Project is a GitHub platform dedicated to highlighting the best from the open source software community—the people and tech behind projects you use every day. Each month this newsletter will highlight new stories, best practices, and opinions developed for The ReadME Project, as well as sharing great listens and reads from across the community.",
  ),
  MailsModel(
    senderName: "Chegg India",
    time: "09:37",
    subject: "Payment Initiated to your account",
    desc:
        "MNIDESDFSDFQAAUG2021 Warm Regards Axis Bank This is a system generated mail. Please do not reply to this email.",
  ),
  MailsModel(
    senderName: "Manohar Kademasetti",
    time: "09:05",
    subject:
        "Announcing Log Drains: Manage traffic and serverless logs in Datadog",
    desc:
        "Hi Charan, \n\nWe’re excited to announce that you can now search, set alerts, and analyze your Netlify traffic and serverless functions logs alongside your other logs when using Datadog Log Management. The integration is made possible with new Netlify Log Drains, which will extend to other log management and cloud storage solutions soon.\n\n\nLog Drains are now available with Netlify’s Enterprise plan. Head over to our blog to learn more. Or contact sales to ask about upgrading to take advantage of this new feature.\n\n\nHappy Building!",
  ),
];
