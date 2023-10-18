class AgencyResult {
  List<Agency> results;

  AgencyResult({required this.results});
  factory AgencyResult.fromJson(Map<String, dynamic> json) {
    return AgencyResult(
      results:
          (json['results'] as List).map((i) => Agency.fromJson(i)).toList(),
    );
  }
}

class Agency {
  int? agencyId;
  String? toptierCode;
  String? abbreviation;
  String? agencyName;
  String? congressionalJustificationUrl;
  String? activeFy;
  String? activeFq;
  double? outlayAmount;
  double? obligatedAmount;
  double? budgetAuthorityAmount;
  double? currentTotalBudgetAuthorityAmount;
  double? percentageOfTotalBudgetAuthority;
  String? agencySlug;

  Agency({
    this.agencyId,
    this.toptierCode,
    this.abbreviation,
    this.agencyName,
    this.congressionalJustificationUrl,
    this.activeFy,
    this.activeFq,
    this.outlayAmount,
    this.obligatedAmount,
    this.budgetAuthorityAmount,
    this.currentTotalBudgetAuthorityAmount,
    this.percentageOfTotalBudgetAuthority,
    this.agencySlug,
  });

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
      agencyId: json['agency_id'],
      toptierCode: json['toptier_code'],
      abbreviation: json['abbreviation'],
      agencyName: json['agency_name'],
      congressionalJustificationUrl: json['congressional_justification_url'],
      activeFy: json['active_fy'],
      activeFq: json['active_fq'],
      outlayAmount: json['outlay_amount'].toDouble(),
      obligatedAmount: json['obligated_amount'].toDouble(),
      budgetAuthorityAmount: json['budget_authority_amount'].toDouble(),
      currentTotalBudgetAuthorityAmount:
          json['current_total_budget_authority_amount'].toDouble(),
      percentageOfTotalBudgetAuthority:
          json['percentage_of_total_budget_authority'].toDouble(),
      agencySlug: json['agency_slug'],
    );
  }
}
