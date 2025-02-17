part of '../view/company_job_applied_candidate_profile.dart';

class _CompanyJobCandidateProfileHeader
    extends GetView<UserDetailsViewController> {
  const _CompanyJobCandidateProfileHeader();
  // final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 76,
          height: 76,
          alignment: Alignment.center,
          decoration: const ShapeDecoration(
            color: CommonColor.greyColor15,
            shape: CircleBorder(),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              controller.userModel?.image ?? '',
              cacheHeight: 129,
              cacheWidth: 199,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(noImageFound);
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          textAlign: TextAlign.center,
          controller.userModel?.name ?? '',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 22,

            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          controller.userModel?.phone ?? '',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 15,

            fontWeight: FontWeight.w500,
          ),
        ),
        //const SizedBox(height: 8),
        Text(
          controller.userModel?.address ?? '',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 15,

            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
