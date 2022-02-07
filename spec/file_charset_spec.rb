RSpec.describe FileCharset do
  it "has a version number" do
    expect(FileCharset::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe ".invalid_encoding_paths?" do
    context "specify the encoding UTF_8" do
      context "All files' encoding are UTF_8" do
        it "return empty array" do
          expect(
            FileCharset.invalid_encoding_paths?(["spec/sample/rashomon/UTF_8.txt", "spec/sample/rashomon/UTF_8.txt", "spec/sample/rashomon/UTF_8.txt"], Encoding::UTF_8)
          ).to be_empty
        end
      end

      context "Some files' encoding are UTF_8, and other is Shift_JIS" do
        it "return a array including Shift_JIS" do
          expect(
            FileCharset.invalid_encoding_paths?(["spec/sample/rashomon/UTF_8.txt", "spec/sample/rashomon/Shift_JIS.txt", "spec/sample/rashomon/UTF_8.txt"], Encoding::UTF_8)
          ).to match_array(
            ["spec/sample/rashomon/Shift_JIS.txt"]
          )

        end
      end

      context "Some files' encoding are EUC_JP, and another is Shift_JIS, and the other is Shift_JIS" do
        it "return a array including Shift_JIS and EUC_JP" do
          expect(
            FileCharset.invalid_encoding_paths?(["spec/sample/rashomon/UTF_8.txt", "spec/sample/rashomon/EUC_JP.txt", "spec/sample/rashomon/Shift_JIS.txt"], Encoding::UTF_8)
          ).to match_array(
            ["spec/sample/rashomon/EUC_JP.txt", "spec/sample/rashomon/Shift_JIS.txt"]
          )
        end
      end
    end

    context "specify the encoding Shift_JIS" do
      context "All files' encoding are Shift_JIS" do
        it "return empty array" do
          expect(
            FileCharset.invalid_encoding_paths?(["spec/sample/rashomon/Shift_JIS.txt", "spec/sample/rashomon/Shift_JIS.txt", "spec/sample/rashomon/Shift_JIS.txt"], Encoding::Shift_JIS)
          ).to be_empty
        end
      end

      context "Some files' encoding are Shift_JIS, and other is UTF_8" do
        it "return a array including UTF-8" do
          expect(
            FileCharset.invalid_encoding_paths?(["spec/sample/rashomon/Shift_JIS.txt", "spec/sample/rashomon/Shift_JIS.txt", "spec/sample/rashomon/UTF_8.txt"], Encoding::Shift_JIS)
          ).to match_array(
            ["spec/sample/rashomon/UTF_8.txt"]
          )

        end
      end

      context "Some files' encoding are EUC_JP, and another is Shift_JIS, and the other is Shift_JIS" do
        it "return a array including UTF-8 and EUC_JP" do
          expect(
            FileCharset.invalid_encoding_paths?(["spec/sample/rashomon/UTF_8.txt", "spec/sample/rashomon/EUC_JP.txt", "spec/sample/rashomon/Shift_JIS.txt"], Encoding::Shift_JIS)
          ).to match_array(
            ["spec/sample/rashomon/UTF_8.txt", "spec/sample/rashomon/EUC_JP.txt"]
          )
        end
      end
    end

    context "specify the encoding EUC_JP" do
      context "All files' encoding are EUC_JP" do
        it "return empty array" do
          expect(
            FileCharset.invalid_encoding_paths?(["spec/sample/rashomon/EUC_JP.txt", "spec/sample/rashomon/EUC_JP.txt", "spec/sample/rashomon/EUC_JP.txt"], Encoding::EUC_JP)
          ).to be_empty
        end
      end

      context "Some files' encoding are EUC_JP, and other is UTF_8" do
        it "return a array including UTF-8" do
          expect(
            FileCharset.invalid_encoding_paths?(["spec/sample/rashomon/EUC_JP.txt", "spec/sample/rashomon/UTF_8.txt", "spec/sample/rashomon/EUC_JP.txt"], Encoding::EUC_JP)
          ).to match_array(
            ["spec/sample/rashomon/UTF_8.txt"]
          )

        end
      end

      context "Some files' encoding are EUC_JP, and another is Shift_JIS, and the other is Shift_JIS" do
        it "return a array including UTF-8 and Shift_JIS" do
          expect(
            FileCharset.invalid_encoding_paths?(["spec/sample/rashomon/UTF_8.txt", "spec/sample/rashomon/EUC_JP.txt", "spec/sample/rashomon/Shift_JIS.txt"], Encoding::EUC_JP)
          ).to match_array(
            ["spec/sample/rashomon/UTF_8.txt", "spec/sample/rashomon/Shift_JIS.txt"]
          )
        end
      end
    end
  end
  describe ".check_paths" do
    #TODO:  write here
  end
end
