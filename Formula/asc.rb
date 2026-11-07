# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.5.1'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.5.1/asc_6.5.1_macOS_arm64'
      sha256 '37e98ce44c126dad6f1758daa2d4c015ca6ddca1a7d6afac8d6792a7e5164485'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.5.1/asc_6.5.1_macOS_amd64'
      sha256 '1a59e1fb19fb09d7843cec07b1a67647299c6f805048ccfca4790113550ff76b'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.5.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.5.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
