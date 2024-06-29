final RegExp EMAIL_VALIDATION_REGEX = 
  RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

final RegExp PASSWORD_VALIDATION_REGEX = 
  RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$&*])[A-Za-z\d!@#\$&*]{8,}$');

final RegExp NAME_VALIDATION_REGEX = 
  RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");

final String PLACEHOLDER_PFP = 
  "https://cdn.racingnews365.com/Riders/Vettel/_570x570_crop_center-center_none/f1_2022_sv_ast_lg.png?v=1649398828";